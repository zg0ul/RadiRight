import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/answer_option.dart';
import '../models/assessment_result.dart';
import '../models/decision_node.dart';
import '../models/imaging_recommendation.dart';

part 'decision_engine.g.dart';

class DecisionEngineState {
  final String topicId;
  final String topicName;
  final DecisionNode currentNode;
  final List<DecisionNode> nodeHistory;
  final List<AnswerRecord> answerHistory;
  final bool isComplete;

  const DecisionEngineState({
    required this.topicId,
    required this.topicName,
    required this.currentNode,
    this.nodeHistory = const [],
    this.answerHistory = const [],
    this.isComplete = false,
  });

  DecisionEngineState copyWith({
    String? topicId,
    String? topicName,
    DecisionNode? currentNode,
    List<DecisionNode>? nodeHistory,
    List<AnswerRecord>? answerHistory,
    bool? isComplete,
  }) {
    return DecisionEngineState(
      topicId: topicId ?? this.topicId,
      topicName: topicName ?? this.topicName,
      currentNode: currentNode ?? this.currentNode,
      nodeHistory: nodeHistory ?? this.nodeHistory,
      answerHistory: answerHistory ?? this.answerHistory,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  int get questionNumber => answerHistory.length + 1;

  bool get canGoBack => nodeHistory.isNotEmpty;

  List<ImagingRecommendation> get recommendations {
    if (!isComplete) return [];
    return switch (currentNode) {
      ResultNode(:final recommendations) => recommendations,
      QuestionNode() => [],
    };
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

@riverpod
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
  }) {
    _nodeCache = allNodes;
    state = DecisionEngineState(
      topicId: topicId,
      topicName: topicName,
      currentNode: rootNode,
    );
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

    final nextNode = _nodeCache[selectedOption.nextNodeId];
    if (nextNode == null) {
      throw Exception('Node not found: ${selectedOption.nextNodeId}');
    }

    final isResult = nextNode is ResultNode;

    state = currentState.copyWith(
      currentNode: nextNode,
      nodeHistory: [...currentState.nodeHistory, currentNode],
      answerHistory: [...currentState.answerHistory, answerRecord],
      isComplete: isResult,
    );
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
