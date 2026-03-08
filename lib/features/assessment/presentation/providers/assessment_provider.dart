import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radi_right/features/assessment/domain/enums/imaging_modality.dart';
import 'package:radi_right/features/assessment/domain/models/decision_node.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/assessment_repository.dart';
import '../../domain/models/panel.dart';
import '../../domain/models/topic.dart';
import '../../domain/services/decision_engine.dart';

part 'assessment_provider.g.dart';

@riverpod
Future<List<Panel>> panels(Ref ref) async {
  final repository = ref.watch(assessmentRepositoryProvider);
  final result = await repository.getPanels();
  return result.fold((error) => throw Exception(error.displayMessage), (panels) => panels);
}

@riverpod
Future<List<Topic>> topics(Ref ref, String panelId) async {
  final repository = ref.watch(assessmentRepositoryProvider);
  final result = await repository.getTopics(panelId);
  return result.fold((error) => throw Exception(error.displayMessage), (topics) => topics);
}

@riverpod
Future<Topic?> topic(Ref ref, String topicId) async {
  final repository = ref.watch(assessmentRepositoryProvider);
  final result = await repository.getTopic(topicId);
  return result.fold((error) => throw Exception(error.displayMessage), (topic) => topic);
}

@Riverpod(keepAlive: true)
class CurrentAssessment extends _$CurrentAssessment {
  @override
  AssessmentState build() {
    return const AssessmentState();
  }

  /// Selects the imaging modality the doctor wants to evaluate.
  /// This should be called in Step 1 of the new flow.
  void selectModality(ImagingModality modality) {
    state = state.copyWith(selectedModality: modality);
  }

  /// Selects the clinical area (panel).
  /// This should be called in Step 2 of the new flow.
  void selectPanel(String panelId, String panelName) {
    state = state.copyWith(selectedPanelId: panelId, selectedPanelName: panelName);
  }

  /// Clears the modality selection (for back navigation)
  void clearModality() {
    state = state.copyWith(clearModality: true);
  }

  /// Clears the panel selection (for back navigation)
  void clearPanel() {
    state = state.copyWith(clearPanel: true);
  }

  Future<void> startAssessment(String topicId) async {
    state = state.copyWith(isLoading: true, error: null);

    final repository = ref.read(assessmentRepositoryProvider);

    // Get the topic
    final topicResult = await repository.getTopic(topicId);
    final topic = topicResult.fold((error) {
      state = state.copyWith(isLoading: false, error: error.displayMessage);
      return null;
    }, (topic) => topic);

    if (topic == null) {
      state = state.copyWith(isLoading: false, error: 'Topic not found');
      return;
    }

    // Get all nodes for the topic
    final nodesResult = await repository.getAllNodesForTopic(topicId);
    final nodes = nodesResult.fold((error) {
      state = state.copyWith(isLoading: false, error: error.displayMessage);
      return <String, DecisionNode>{};
    }, (nodes) => nodes);

    if (nodes.isEmpty) {
      state = state.copyWith(isLoading: false, error: 'No decision tree found');
      return;
    }

    // Get the root node
    final rootNode = nodes[topic.rootNodeId];
    if (rootNode == null) {
      state = state.copyWith(isLoading: false, error: 'Root node not found');
      return;
    }

    // Initialize the decision engine with the selected modality
    ref.read(decisionEngineProvider.notifier).initialize(
          topicId: topicId,
          topicName: topic.name,
          rootNode: rootNode,
          allNodes: nodes,
          selectedModality: state.selectedModality,
        );

    state = state.copyWith(
      isLoading: false,
      error: null,
      topicId: topicId,
      topicName: topic.name,
      isActive: true,
    );
  }

  void reset() {
    ref.read(decisionEngineProvider.notifier).reset();
    state = const AssessmentState();
  }
}

class AssessmentState {
  final bool isLoading;
  final String? error;
  final String? topicId;
  final String? topicName;
  final bool isActive;

  /// The imaging modality selected by the doctor at the start of the assessment
  final ImagingModality? selectedModality;

  /// The panel ID selected by the doctor
  final String? selectedPanelId;

  /// The panel name for display purposes
  final String? selectedPanelName;

  const AssessmentState({
    this.isLoading = false,
    this.error,
    this.topicId,
    this.topicName,
    this.isActive = false,
    this.selectedModality,
    this.selectedPanelId,
    this.selectedPanelName,
  });

  AssessmentState copyWith({
    bool? isLoading,
    String? error,
    String? topicId,
    String? topicName,
    bool? isActive,
    ImagingModality? selectedModality,
    String? selectedPanelId,
    String? selectedPanelName,
    bool clearModality = false,
    bool clearPanel = false,
  }) {
    return AssessmentState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      topicId: topicId ?? this.topicId,
      topicName: topicName ?? this.topicName,
      isActive: isActive ?? this.isActive,
      selectedModality:
          clearModality ? null : (selectedModality ?? this.selectedModality),
      selectedPanelId:
          clearPanel ? null : (selectedPanelId ?? this.selectedPanelId),
      selectedPanelName:
          clearPanel ? null : (selectedPanelName ?? this.selectedPanelName),
    );
  }

  /// Whether a modality has been selected
  bool get hasSelectedModality => selectedModality != null;

  /// Whether a panel has been selected
  bool get hasSelectedPanel => selectedPanelId != null;
}
