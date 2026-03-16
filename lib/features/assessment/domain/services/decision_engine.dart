import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:radi_right/features/assessment/domain/enums/imaging_modality.dart';
import 'package:radi_right/features/assessment/domain/models/modality_comparison_result.dart';
import '../models/answer_option.dart';
import '../models/assessment_result.dart';
import '../models/decision_node.dart';
import '../models/imaging_recommendation.dart';
import '../models/navigation_rule.dart';
import '../models/red_flag_info.dart';

part 'decision_engine.g.dart';

class DecisionEngineState {
  final String topicId;
  final String topicName;
  final DecisionNode currentNode;
  final List<DecisionNode> nodeHistory;
  final List<AnswerRecord> answerHistory;
  final bool isComplete;
  final Map<String, dynamic> assessmentContext;
  final List<RedFlagInfo> redFlags;
  final Map<String, int> modalityScores;

  /// The imaging modality the doctor selected at the start of the assessment
  final ImagingModality? selectedModality;

  /// When the assessment was started (set on initialize).
  final DateTime? startedAt;

  /// True after this run has been persisted to assessment history (avoids duplicate saves).
  final bool savedToHistory;

  const DecisionEngineState({
    required this.topicId,
    required this.topicName,
    required this.currentNode,
    this.nodeHistory = const [],
    this.answerHistory = const [],
    this.isComplete = false,
    this.assessmentContext = const {},
    this.redFlags = const [],
    this.modalityScores = const {},
    this.selectedModality,
    this.startedAt,
    this.savedToHistory = false,
  });

  DecisionEngineState copyWith({
    String? topicId,
    String? topicName,
    DecisionNode? currentNode,
    List<DecisionNode>? nodeHistory,
    List<AnswerRecord>? answerHistory,
    bool? isComplete,
    Map<String, dynamic>? assessmentContext,
    List<RedFlagInfo>? redFlags,
    Map<String, int>? modalityScores,
    ImagingModality? selectedModality,
    DateTime? startedAt,
    bool? savedToHistory,
  }) {
    return DecisionEngineState(
      topicId: topicId ?? this.topicId,
      topicName: topicName ?? this.topicName,
      currentNode: currentNode ?? this.currentNode,
      nodeHistory: nodeHistory ?? this.nodeHistory,
      answerHistory: answerHistory ?? this.answerHistory,
      isComplete: isComplete ?? this.isComplete,
      assessmentContext: assessmentContext ?? this.assessmentContext,
      redFlags: redFlags ?? this.redFlags,
      modalityScores: modalityScores ?? this.modalityScores,
      selectedModality: selectedModality ?? this.selectedModality,
      startedAt: startedAt ?? this.startedAt,
      savedToHistory: savedToHistory ?? this.savedToHistory,
    );
  }

  int get questionNumber => answerHistory.length + 1;

  bool get canGoBack => nodeHistory.isNotEmpty;

  List<ImagingRecommendation> get recommendations {
    if (!isComplete) return [];
    return switch (currentNode) {
      ResultNode(:final recommendations) => recommendations,
      QuestionNode() => [],
      NoGuidelinesNode() => [],
    };
  }

  /// Computes the comparison result between the doctor's selected modality
  /// and the ACR recommendations. Returns null if assessment is not complete
  /// or no modality was selected.
  ModalityComparisonResult? get comparisonResult {
    if (!isComplete || selectedModality == null) return null;
    return ModalityComparisonResult.compute(
      selectedModality: selectedModality!,
      recommendations: recommendations,
    );
  }

  AssessmentResult? get result {
    if (!isComplete) return null;
    return AssessmentResult(
      topicId: topicId,
      topicName: topicName,
      recommendations: recommendations,
      answerHistory: answerHistory,
      completedAt: DateTime.now(),
    );
  }
}

@Riverpod(keepAlive: true)
class DecisionEngine extends _$DecisionEngine {
  Map<String, DecisionNode> _nodeCache = {};

  @override
  DecisionEngineState? build() {
    return null;
  }

  void initialize({
    required String topicId,
    required String topicName,
    required DecisionNode rootNode,
    required Map<String, DecisionNode> allNodes,
    ImagingModality? selectedModality,
  }) {
    _nodeCache = allNodes;
    state = DecisionEngineState(
      topicId: topicId,
      topicName: topicName,
      currentNode: rootNode,
      assessmentContext: <String, dynamic>{},
      selectedModality: selectedModality,
      startedAt: DateTime.now(),
    );
  }

  void markSavedToHistory() {
    if (state != null) {
      state = state!.copyWith(savedToHistory: true);
    }
  }

  /// Sets the imaging modality selected by the doctor.
  /// This should be called before starting the assessment.
  void setSelectedModality(ImagingModality modality) {
    if (state == null) return;
    state = state!.copyWith(selectedModality: modality);
  }

  void selectAnswer(AnswerOption selectedOption, String locale) {
    if (state == null) return;

    final currentState = state!;
    final currentNode = currentState.currentNode;

    if (currentNode is! QuestionNode) return;

    final answerRecord = AnswerRecord(
      nodeId: currentNode.id,
      questionText: currentNode.questionText,
      selectedOptionId: selectedOption.id,
      selectedOptionText: selectedOption.text,
    );

    // Merge contextData into assessmentContext
    Map<String, dynamic> newContext = Map<String, dynamic>.from(currentState.assessmentContext);
    if (selectedOption.contextData != null) {
      newContext.addAll(selectedOption.contextData!);
    }

    // Append red flag if present
    List<RedFlagInfo> newRedFlags = List<RedFlagInfo>.from(currentState.redFlags);
    if (selectedOption.redFlag != null) {
      newRedFlags.add(selectedOption.redFlag!);
    }

    // Update modality scores if present
    Map<String, int> newScores = Map<String, int>.from(currentState.modalityScores);
    if (selectedOption.scoreImpact != null) {
      newScores[selectedOption.scoreImpact!.modalityKey] = selectedOption.scoreImpact!.score;
    }

    // Resolve next node id: use NavigationRule if present, else nextNodeId
    final nextNodeId = _resolveNextNodeId(selectedOption, newContext);
    final nextNode = _nodeCache[nextNodeId];
    if (nextNode == null) {
      throw Exception('Node not found: $nextNodeId');
    }

    final isResult = nextNode is ResultNode || nextNode is NoGuidelinesNode;

    state = currentState.copyWith(
      currentNode: nextNode,
      nodeHistory: [...currentState.nodeHistory, currentNode],
      answerHistory: [...currentState.answerHistory, answerRecord],
      isComplete: isResult,
      assessmentContext: newContext,
      redFlags: newRedFlags,
      modalityScores: newScores,
    );
  }

  String _resolveNextNodeId(AnswerOption option, Map<String, dynamic> context) {
    final rule = option.navigationRule;
    if (rule == null) return option.nextNodeId;
    return switch (rule) {
      DirectNavigation(:final nextNodeId) => nextNodeId,
      ConditionalNavigation(:final conditions, :final defaultNodeId) =>
        _evaluateConditional(conditions, context) ?? defaultNodeId,
      ComputedNavigation(:final computationKey, :final parameters) =>
        _evaluateComputed(computationKey, parameters, context) ?? option.nextNodeId,
    };
  }

  String? _evaluateConditional(List<NavigationCondition> conditions, Map<String, dynamic> context) {
    for (final c in conditions) {
      final contextValue = context[c.contextKey];
      if (_evaluateCondition(contextValue, c.operator, c.value)) {
        return c.targetNodeId;
      }
    }
    return null;
  }

  bool _evaluateCondition(dynamic contextValue, ComparisonOperator op, dynamic value) {
    switch (op) {
      case ComparisonOperator.equals:
        return contextValue == value;
      case ComparisonOperator.notEquals:
        return contextValue != value;
      case ComparisonOperator.greaterThan:
        return (contextValue is num && value is num) && contextValue.toDouble() > value.toDouble();
      case ComparisonOperator.lessThan:
        return (contextValue is num && value is num) && contextValue.toDouble() < value.toDouble();
      case ComparisonOperator.greaterOrEqual:
        return (contextValue is num && value is num) && contextValue.toDouble() >= value.toDouble();
      case ComparisonOperator.lessOrEqual:
        return (contextValue is num && value is num) && contextValue.toDouble() <= value.toDouble();
      case ComparisonOperator.contains:
        return value is List && value.contains(contextValue);
      case ComparisonOperator.anyOf:
        return contextValue is List && (value as List).any((v) => contextValue.contains(v));
    }
  }

  String? _evaluateComputed(String computationKey, Map<String, dynamic>? parameters, Map<String, dynamic> context) {
    // Placeholder: no computed strategies yet; caller falls back to nextNodeId
    return null;
  }

  void goBack() {
    if (state == null || !state!.canGoBack) return;

    final currentState = state!;
    final previousNodes = List<DecisionNode>.from(currentState.nodeHistory);
    final previousAnswers = List<AnswerRecord>.from(currentState.answerHistory);

    final previousNode = previousNodes.removeLast();
    if (previousAnswers.isNotEmpty) {
      previousAnswers.removeLast();
    }

    state = currentState.copyWith(
      currentNode: previousNode,
      nodeHistory: previousNodes,
      answerHistory: previousAnswers,
      isComplete: false,
    );
  }

  void reset() {
    _nodeCache = {};
    state = null;
  }
}
