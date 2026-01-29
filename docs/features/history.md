# History Feature

## Overview

The history feature stores completed assessments in Firebase Firestore, allowing users to review past assessments across devices.

## Data Models

### AssessmentHistory
```dart
@freezed
class AssessmentHistory with _$AssessmentHistory {
  const factory AssessmentHistory({
    required String id,
    required String userId,
    required String topicId,
    required String topicName,
    required DateTime startedAt,
    required DateTime completedAt,
    required List<AnswerRecord> answers,
    AssessmentResult? result,
  }) = _AssessmentHistory;

  Duration get duration;
  String get formattedDate;
  String get formattedTime;
}
```

### AnswerRecord
```dart
@freezed
class AnswerRecord with _$AnswerRecord {
  const factory AnswerRecord({
    required String nodeId,
    required String questionText,
    required String selectedOptionId,
    required String selectedOptionText,
  }) = _AnswerRecord;
}
```

## Architecture

### Datasource

```dart
class FirebaseHistoryDatasource {
  Future<List<AssessmentHistory>> getHistory(String userId);
  Stream<List<AssessmentHistory>> historyStream(String userId);
  Future<void> saveAssessment({
    required String userId,
    required AssessmentResult result,
    required DateTime startedAt,
  });
  Future<void> deleteHistory(String historyId);
  Future<void> clearHistory(String userId);
}
```

### Provider

```dart
@riverpod
class HistoryNotifier extends _$HistoryNotifier {
  @override
  Stream<List<AssessmentHistory>> build() {
    final userId = ref.watch(authNotifierProvider).valueOrNull?.id;
    return datasource.historyStream(userId);
  }

  Future<void> deleteHistory(String historyId);
  Future<void> clearAllHistory();
}
```

## Screens

### HistoryScreen
- List of past assessments
- Swipe to delete
- Clear all option
- Empty state

## Firebase Structure

```
assessmentHistory/
  {historyId}/
    - userId: string
    - topicId: string
    - topicName: string
    - startedAt: timestamp
    - completedAt: timestamp
    - answers: array
      - nodeId: string
      - questionText: string
      - selectedOptionId: string
      - selectedOptionText: string
    - recommendations: array (optional)
    - createdAt: timestamp (server)
```

## Saving History

History is automatically saved when an assessment completes:

```dart
// In result screen or assessment provider
await historyDatasource.saveAssessment(
  userId: userId,
  result: assessmentResult,
  startedAt: assessmentStartTime,
);
```

## Usage

```dart
// Watch history
final history = ref.watch(historyNotifierProvider);

history.when(
  data: (items) => ListView(children: items.map(...)),
  loading: () => CircularProgressIndicator(),
  error: (e, _) => Text('Error: $e'),
);

// Delete single item
await ref.read(historyNotifierProvider.notifier)
    .deleteHistory(historyId);

// Clear all
await ref.read(historyNotifierProvider.notifier)
    .clearAllHistory();
```

## Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /assessmentHistory/{historyId} {
      allow read, delete: if request.auth != null
        && resource.data.userId == request.auth.uid;
      allow create: if request.auth != null
        && request.resource.data.userId == request.auth.uid;
    }
  }
}
```
