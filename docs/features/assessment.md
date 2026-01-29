# Assessment Feature

## Overview

The assessment feature is the core of RadiRight, providing decision tree navigation based on ACR Appropriateness Criteria to recommend appropriate imaging studies.

## Data Models

### Panel
```dart
@freezed
class Panel with _$Panel {
  const factory Panel({
    required String id,
    required String name,
    required String nameAr,
    String? description,
    @Default(true) bool isEnabled,
  }) = _Panel;
}
```

### Topic
```dart
@freezed
class Topic with _$Topic {
  const factory Topic({
    required String id,
    required String panelId,
    required String name,
    required String nameAr,
    required String rootNodeId,
  }) = _Topic;
}
```

### DecisionNode (Sealed Class)
```dart
sealed class DecisionNode {
  const factory DecisionNode.question({
    required String id,
    required String questionText,
    required String questionTextAr,
    required List<AnswerOption> options,
    String? hint,
  }) = QuestionNode;

  const factory DecisionNode.result({
    required String id,
    required List<ImagingRecommendation> recommendations,
    String? summary,
  }) = ResultNode;
}
```

### ImagingRecommendation
```dart
@freezed
class ImagingRecommendation with _$ImagingRecommendation {
  const factory ImagingRecommendation({
    required String modality,
    required String procedure,
    required AppropriatenessLevel appropriateness,
    required RadiationLevel radiation,
    String? comments,
    int? score,
  }) = _ImagingRecommendation;
}
```

### Enums

#### AppropriatenessLevel
```dart
enum AppropriatenessLevel {
  usuallyAppropriate,      // Green, Score 7-9
  mayBeAppropriate,        // Orange, Score 4-6
  usuallyNotAppropriate,   // Red, Score 1-3
  noImagingIndicated;      // Gray
}
```

#### RadiationLevel
```dart
enum RadiationLevel {
  none,    // ○
  low,     // ☢
  medium,  // ☢☢
  high;    // ☢☢☢
}
```

## Decision Engine

The `DecisionEngine` service manages assessment state:

```dart
class DecisionEngineState {
  final String topicId;
  final DecisionNode currentNode;
  final List<DecisionNode> nodeHistory;
  final List<AnswerRecord> answerHistory;
  final bool isComplete;

  int get questionNumber;
  bool get canGoBack;
  List<ImagingRecommendation> get recommendations;
}

@riverpod
class DecisionEngine extends _$DecisionEngine {
  void initialize({...});
  void selectAnswer(AnswerOption option, String locale);
  void goBack();
  void reset();
}
```

## Architecture

### Datasources

#### DecisionTreeDatasource (Abstract)
```dart
abstract class DecisionTreeDatasource {
  Future<List<Panel>> getPanels();
  Future<List<Topic>> getTopics(String panelId);
  Future<DecisionNode?> getNode(String nodeId);
  Future<Map<String, DecisionNode>> getAllNodesForTopic(String topicId);
}
```

#### LocalDecisionTreeDatasource
Reads from bundled JSON assets.

#### FirebaseDecisionTreeDatasource
Reads from Firestore (for future dynamic updates).

### Repository

```dart
abstract class AssessmentRepository {
  Future<Either<AppError, List<Panel>>> getPanels();
  Future<Either<AppError, List<Topic>>> getTopics(String panelId);
  Future<Either<AppError, Map<String, DecisionNode>>> getAllNodesForTopic(String topicId);
}
```

## Screens

### PanelSelectionScreen
- List of available panels
- V1: Only MSK panel

### TopicSelectionScreen
- Searchable list of topics
- Topic descriptions

### QuestionScreen
- Current question display
- Answer options
- Progress indicator
- Back navigation
- Hint display (if available)

### ResultScreen
- Grouped imaging recommendations
- Appropriateness indicators
- Radiation levels
- Comments

## Widgets

### AnswerOptionTile
Displays selectable answer option.

### AppropriatenessIndicator
Color-coded appropriateness badge.

### RadiationIndicator
Radiation level with symbols.

## Decision Tree JSON Structure

```json
{
  "panels": [...],
  "topics": [...],
  "nodes": {
    "topic_q1": {
      "id": "topic_q1",
      "topicId": "topic_id",
      "type": "question",
      "questionText": "Question text?",
      "questionTextAr": "نص السؤال؟",
      "options": [
        {
          "id": "opt1",
          "text": "Option 1",
          "textAr": "الخيار ١",
          "nextNodeId": "next_node"
        }
      ]
    },
    "topic_r1": {
      "id": "topic_r1",
      "topicId": "topic_id",
      "type": "result",
      "recommendations": [
        {
          "modality": "MRI",
          "procedure": "MRI without contrast",
          "appropriateness": "usuallyAppropriate",
          "radiation": "none",
          "score": 9
        }
      ]
    }
  }
}
```

## Assessment Flow

1. User selects panel → `PanelSelectionScreen`
2. User selects topic → `TopicSelectionScreen`
3. `CurrentAssessment.startAssessment()` loads decision tree
4. `DecisionEngine` initialized with root node
5. User answers questions → `QuestionScreen`
6. `DecisionEngine.selectAnswer()` navigates tree
7. When `ResultNode` reached → `ResultScreen`
8. Results displayed with recommendations

## Usage

```dart
// Start assessment
await ref.read(currentAssessmentProvider.notifier)
    .startAssessment(topicId);

// Select answer
ref.read(decisionEngineProvider.notifier)
    .selectAnswer(option, locale);

// Go back
ref.read(decisionEngineProvider.notifier).goBack();

// Get current state
final state = ref.watch(decisionEngineProvider);
if (state?.isComplete ?? false) {
  final recommendations = state!.recommendations;
}
```
