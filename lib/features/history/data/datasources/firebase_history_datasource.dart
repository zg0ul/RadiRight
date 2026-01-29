import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../assessment/domain/models/assessment_result.dart';
import '../../domain/models/assessment_history.dart';

part 'firebase_history_datasource.g.dart';

@riverpod
FirebaseHistoryDatasource firebaseHistoryDatasource(Ref ref) {
  return FirebaseHistoryDatasource(FirebaseFirestore.instance);
}

class FirebaseHistoryDatasource {
  final FirebaseFirestore _firestore;

  FirebaseHistoryDatasource(this._firestore);

  CollectionReference<Map<String, dynamic>> get _historyCollection =>
      _firestore.collection('assessmentHistory');

  Future<List<AssessmentHistory>> getHistory(String userId) async {
    final snapshot = await _historyCollection
        .where('userId', isEqualTo: userId)
        .orderBy('completedAt', descending: true)
        .limit(50)
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return _parseHistory(data);
    }).toList();
  }

  Stream<List<AssessmentHistory>> historyStream(String userId) {
    return _historyCollection
        .where('userId', isEqualTo: userId)
        .orderBy('completedAt', descending: true)
        .limit(50)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return _parseHistory(data);
      }).toList();
    });
  }

  Future<void> saveAssessment({
    required String userId,
    required AssessmentResult result,
    required DateTime startedAt,
  }) async {
    final data = {
      'userId': userId,
      'topicId': result.topicId,
      'topicName': result.topicName,
      'startedAt': Timestamp.fromDate(startedAt),
      'completedAt': Timestamp.fromDate(result.completedAt),
      'answers': result.answerHistory
          .map((a) => {
                'nodeId': a.nodeId,
                'questionText': a.questionText,
                'selectedOptionId': a.selectedOptionId,
                'selectedOptionText': a.selectedOptionText,
              })
          .toList(),
      'recommendations': result.recommendations
          .map((r) => r.toJson())
          .toList(),
      'createdAt': FieldValue.serverTimestamp(),
    };

    await _historyCollection.add(data);
  }

  Future<void> deleteHistory(String historyId) async {
    await _historyCollection.doc(historyId).delete();
  }

  Future<void> clearHistory(String userId) async {
    final snapshot =
        await _historyCollection.where('userId', isEqualTo: userId).get();
    final batch = _firestore.batch();
    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }

  AssessmentHistory _parseHistory(Map<String, dynamic> data) {
    final answers = (data['answers'] as List<dynamic>? ?? [])
        .map((a) => AnswerRecord(
              nodeId: a['nodeId'] as String,
              questionText: a['questionText'] as String,
              selectedOptionId: a['selectedOptionId'] as String,
              selectedOptionText: a['selectedOptionText'] as String,
            ))
        .toList();

    return AssessmentHistory(
      id: data['id'] as String,
      odId: data['userId'] as String,
      topicId: data['topicId'] as String,
      topicName: data['topicName'] as String,
      startedAt: (data['startedAt'] as Timestamp).toDate(),
      completedAt: (data['completedAt'] as Timestamp).toDate(),
      answers: answers,
    );
  }
}
