# Contributing to RadiRight

## Code Style

### Dart Style
- Follow official [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter_lints` for consistent linting
- Run `dart format .` before committing

### Naming Conventions
- **Files**: snake_case (`auth_provider.dart`)
- **Classes**: PascalCase (`AuthNotifier`)
- **Functions/Variables**: camelCase (`signInWithEmail`)
- **Constants**: camelCase or SCREAMING_CAPS for environment

### Project Structure
```
feature/
├── data/
│   ├── datasources/
│   │   ├── feature_datasource.dart      # Abstract interface
│   │   └── firebase_feature_datasource.dart
│   └── repositories/
│       └── feature_repository.dart
├── domain/
│   ├── models/
│   ├── enums/
│   └── services/
└── presentation/
    ├── providers/
    ├── screens/
    └── widgets/
```

## Git Workflow

### Branches
- `main` - Production-ready code
- `develop` - Development integration
- `feature/xxx` - Feature branches
- `fix/xxx` - Bug fixes

### Commit Messages
Use conventional commits:
```
feat: add subscription countdown widget
fix: correct RTL layout in assessment screen
docs: update architecture documentation
refactor: extract decision engine logic
```

### Pull Requests
1. Create feature branch from `develop`
2. Write descriptive PR title
3. Include:
   - What changes were made
   - Why they were needed
   - How to test

## Development Workflow

### Adding a New Feature

1. **Create feature folder structure**:
   ```
   lib/features/new_feature/
   ├── data/
   ├── domain/
   └── presentation/
   ```

2. **Define models** (with Freezed):
   ```dart
   @freezed
   class NewModel with _$NewModel {
     const factory NewModel({...}) = _NewModel;
   }
   ```

3. **Create datasource interface**:
   ```dart
   abstract class NewFeatureDatasource {
     Future<List<NewModel>> getItems();
   }
   ```

4. **Implement datasource**:
   ```dart
   class FirebaseNewFeatureDatasource implements NewFeatureDatasource {...}
   ```

5. **Create repository**:
   ```dart
   @riverpod
   NewFeatureRepository newFeatureRepository(Ref ref) {...}
   ```

6. **Create providers**:
   ```dart
   @riverpod
   Future<List<NewModel>> newFeatureItems(Ref ref) async {...}
   ```

7. **Build UI**:
   - Create screen in `presentation/screens/`
   - Add widgets in `presentation/widgets/`
   - Add route in `app/routing/app_router.dart`

8. **Add localization**:
   - Add keys to `app_en.arb` and `app_ar.arb`
   - Run `flutter gen-l10n`

9. **Generate code**:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

### Adding Decision Trees

1. Edit `assets/data/decision_trees/msk_decision_trees.json`
2. Add topic to `topics` array
3. Add nodes to `nodes` object
4. Follow the node schema:

```json
{
  "id": "topic_q1",
  "topicId": "topic_id",
  "type": "question",
  "questionText": "English question?",
  "questionTextAr": "السؤال بالعربية؟",
  "options": [
    {
      "id": "topic_q1_a1",
      "text": "Option 1",
      "textAr": "الخيار ١",
      "nextNodeId": "topic_next_node"
    }
  ]
}
```

### Adding Translations

1. Add key to `lib/l10n/app_en.arb`:
   ```json
   {
     "newKey": "English text",
     "@newKey": {
       "description": "Description for translators"
     }
   }
   ```

2. Add Arabic translation to `lib/l10n/app_ar.arb`:
   ```json
   {
     "newKey": "النص بالعربية"
   }
   ```

3. Regenerate:
   ```bash
   flutter gen-l10n
   ```

## Code Review Checklist

- [ ] Code follows style guidelines
- [ ] All new code has appropriate tests
- [ ] Documentation is updated
- [ ] No hardcoded strings (use l10n)
- [ ] RTL support considered
- [ ] No sensitive data in code
- [ ] Build passes
- [ ] No lint warnings
