import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../assessment/domain/services/decision_engine.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/datasources/firebase_history_datasource.dart';
import '../../domain/models/assessment_history.dart';

part 'history_provider.g.dart';

@riverpod
class HistoryNotifier extends _$HistoryNotifier {
  @override
  Stream<List<AssessmentHistory>> build() {
    final authState = ref.watch(authNotifierProvider);
    final userId = authState.valueOrNull?.id;

    if (userId == null) {
      return Stream.value([]);
    }

    final datasource = ref.watch(firebaseHistoryDatasourceProvider);
    return datasource.historyStream(userId);
  }

  /// Saves the current assessment to Firestore if complete, user is signed in, and not already saved.
  Future<void> saveCurrentAssessmentIfNeeded() async {
    final engineState = ref.read(decisionEngineProvider);
    final userId = ref.read(authNotifierProvider).valueOrNull?.id;

    if (userId == null ||
        engineState == null ||
        !engineState.isComplete ||
        engineState.savedToHistory) {
      return;
    }

    final result = engineState.result;
    final startedAt = engineState.startedAt ?? result?.completedAt;
    if (result == null || startedAt == null) return;

    // Get comparison result for storing selected modality and match result
    final comparisonResult = engineState.comparisonResult;

    final datasource = ref.read(firebaseHistoryDatasourceProvider);
    await datasource.saveAssessment(
      userId: userId,
      result: result,
      startedAt: startedAt,
      selectedModality: comparisonResult?.selectedModality,
      matchResult: comparisonResult?.matchResult,
    );
    ref.read(decisionEngineProvider.notifier).markSavedToHistory();
  }

  Future<void> deleteHistory(String historyId) async {
    final datasource = ref.read(firebaseHistoryDatasourceProvider);
    await datasource.deleteHistory(historyId);
  }

  Future<void> clearAllHistory() async {
    final authState = ref.read(authNotifierProvider);
    final userId = authState.valueOrNull?.id;

    if (userId == null) return;

    final datasource = ref.read(firebaseHistoryDatasourceProvider);
    await datasource.clearHistory(userId);
  }
}
