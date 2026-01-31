import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import '../../../../app/routing/routes.dart';
import '../../domain/models/patient_profile.dart';
import '../providers/assessment_provider.dart';

class DemographicsScreen extends ConsumerStatefulWidget {
  final String topicId;

  const DemographicsScreen({super.key, required this.topicId});

  @override
  ConsumerState<DemographicsScreen> createState() => _DemographicsScreenState();
}

class _DemographicsScreenState extends ConsumerState<DemographicsScreen> {
  String? _ageGroup;
  String? _sex;
  String? _anatomicalLocation;

  static const List<String> _ageGroups = ['0-18 years', '19-40 years', '41-65 years', '65+ years'];
  static const List<String> _sexOptions = ['Male', 'Female'];
  static const List<String> _anatomicalLocations = [
    'Upper extremity',
    'Lower extremity',
    'Spine',
    'Pelvis',
    'Shoulder',
    'Knee',
    'Hip',
    'Ankle',
    'Wrist',
  ];

  String _l10nAgeGroup(String value) {
    final l10n = AppLocalizations.of(context)!;
    switch (value) {
      case '0-18 years':
        return l10n.ageGroup0to18;
      case '19-40 years':
        return l10n.ageGroup19to40;
      case '41-65 years':
        return l10n.ageGroup41to65;
      case '65+ years':
        return l10n.ageGroup65Plus;
      default:
        return value;
    }
  }

  String _l10nSex(String value) {
    final l10n = AppLocalizations.of(context)!;
    return value == 'Male' ? l10n.male : l10n.female;
  }

  String _l10nLocation(String value) {
    final l10n = AppLocalizations.of(context)!;
    switch (value) {
      case 'Upper extremity':
        return l10n.upperExtremity;
      case 'Lower extremity':
        return l10n.lowerExtremity;
      case 'Spine':
        return l10n.spine;
      case 'Pelvis':
        return l10n.pelvis;
      case 'Shoulder':
        return l10n.shoulder;
      case 'Knee':
        return l10n.knee;
      case 'Hip':
        return l10n.hip;
      case 'Ankle':
        return l10n.ankle;
      case 'Wrist':
        return l10n.wrist;
      default:
        return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.patientDemographics),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => context.pop()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.patientDemographicsSubtitle,
              style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            _SectionTitle(title: l10n.ageGroup),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _ageGroups.map((value) {
                final selected = _ageGroup == value;
                return FilterChip(
                  label: Text(_l10nAgeGroup(value)),
                  selected: selected,
                  onSelected: (_) => setState(() => _ageGroup = value),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            _SectionTitle(title: l10n.sex),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _sexOptions.map((value) {
                final selected = _sex == value;
                return FilterChip(
                  label: Text(_l10nSex(value)),
                  selected: selected,
                  onSelected: (_) => setState(() => _sex = value),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            _SectionTitle(title: l10n.anatomicalLocation),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _anatomicalLocations.map((value) {
                final selected = _anatomicalLocation == value;
                return FilterChip(
                  label: Text(_l10nLocation(value)),
                  selected: selected,
                  onSelected: (_) => setState(() => _anatomicalLocation = value),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: _ageGroup != null && _sex != null && _anatomicalLocation != null ? _onContinue : null,
              child: Text(l10n.continueButton),
            ),
            const SizedBox(height: 16),
            OutlinedButton(onPressed: () => context.pop(), child: Text(l10n.back)),
          ],
        ),
      ),
    );
  }

  Future<void> _onContinue() async {
    final profile = PatientProfile(ageGroup: _ageGroup!, sex: _sex!, anatomicalLocation: _anatomicalLocation!);
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  Text(
                    l10n.preparingAssessment,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.preparingAssessmentSubtitle,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    await ref.read(currentAssessmentProvider.notifier).startAssessment(widget.topicId, patientProfile: profile);
    if (!mounted) return;
    Navigator.of(context).pop();
    final assessmentState = ref.read(currentAssessmentProvider);
    if (assessmentState.isActive) {
      context.push(AppRoutes.question);
    } else if (assessmentState.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(assessmentState.error!), backgroundColor: Theme.of(context).colorScheme.error),
      );
    }
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
    );
  }
}
