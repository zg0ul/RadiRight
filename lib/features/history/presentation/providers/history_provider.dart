import 'package:riverpod_annotation/riverpod_annotation.dart';
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
