import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/core/widgets/app_scaffold.dart';
import 'package:radi_right/shared/widgets/glassmorphism_card.dart';
import 'package:radi_right/l10n/app_localizations.dart';

/// Analyzing state shown when assessment is complete and processing results
class QuestionAnalyzingState extends StatelessWidget {
  final AppLocalizations l10n;

  const QuestionAnalyzingState({super.key, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      showBackButton: false,
      showContentPadding: false,
      showAppBar: false,
      child: Center(
        child:
            GlassmorphismCard(
                  padding: EdgeInsets.all(AppConstants.spacingXL),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(color: theme.colorScheme.primary),
                      AppSpacer.verticalLG,
                      Text(
                        l10n.analyzingResponses,
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      AppSpacer.verticalSM,
                      Text(
                        l10n.analyzingResponsesSubtitle,
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
                .animate()
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1, 1),
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.elasticOut,
                )
                .fadeIn(duration: const Duration(milliseconds: 300)),
      ),
    );
  }
}
