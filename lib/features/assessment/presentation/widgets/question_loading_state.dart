import 'package:flutter/material.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/core/widgets/app_scaffold.dart';
import 'package:radi_right/l10n/app_localizations.dart';

/// Loading state displayed while preparing the assessment
class QuestionLoadingState extends StatelessWidget {

  const QuestionLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return AppScaffold(
      showBackButton: false,
      showContentPadding: false,
      showAppBar: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            AppSpacer.verticalMD,
            Text(l10n.preparingAssessment, style: theme.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
