import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:radi_right/features/assessment/domain/enums/imaging_modality.dart';
import 'package:radi_right/features/assessment/domain/enums/modality_match_result.dart';
import 'package:radi_right/features/assessment/domain/models/assessment_result.dart';
import 'package:radi_right/features/assessment/domain/models/imaging_recommendation.dart';
import 'package:radi_right/features/history/domain/models/assessment_history.dart';

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
    ImagingModality? selectedModality,
    ModalityMatchResult? matchResult,
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
      'selectedModality': selectedModality?.name,
      'matchResult': matchResult?.name,
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

    final completedAt = (data['completedAt'] as Timestamp).toDate();
    final recsList = data['recommendations'] as List<dynamic>? ?? [];
    final recommendations = recsList
        .map((r) => ImagingRecommendation.fromJson(Map<String, dynamic>.from(r as Map)))
        .toList();

    AssessmentResult? result;
    if (recommendations.isNotEmpty) {
      result = AssessmentResult(
        topicId: data['topicId'] as String,
        topicName: data['topicName'] as String,
        recommendations: recommendations,
        answerHistory: answers,
        completedAt: completedAt,
      );
    }

    // Parse selectedModality
    ImagingModality? selectedModality;
    final modalityStr = data['selectedModality'] as String?;
    if (modalityStr != null) {
      selectedModality = ImagingModality.values.firstWhere(
        (m) => m.name == modalityStr,
        orElse: () => ImagingModality.xRay,
      );
    }

    // Parse matchResult
    ModalityMatchResult? matchResult;
    final matchResultStr = data['matchResult'] as String?;
    if (matchResultStr != null) {
      matchResult = ModalityMatchResult.values.firstWhere(
        (m) => m.name == matchResultStr,
        orElse: () => ModalityMatchResult.notIndicated,
      );
    }

    return AssessmentHistory(
      id: data['id'] as String,
      odId: data['userId'] as String,
      topicId: data['topicId'] as String,
      topicName: data['topicName'] as String,
      startedAt: (data['startedAt'] as Timestamp).toDate(),
      completedAt: completedAt,
      answers: answers,
      result: result,
      selectedModality: selectedModality,
      matchResult: matchResult,
    );
  }
}
