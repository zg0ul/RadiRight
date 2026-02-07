import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/features/assessment/presentation/providers/assessment_provider.dart';
import 'package:radi_right/l10n/app_localizations.dart';

void showExitDialog(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog.adaptive(
      title: Text(l10n.cancel, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
      content: Text(
        l10n.exitProgressWarning,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w500,
          height: 1.1,
        ),
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
          ),
          onPressed: () => Navigator.of(dialogContext).pop(),
          child: Text(l10n.no),
        ),
        TextButton(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
          ),
          onPressed: () {
            Navigator.of(dialogContext).pop();
            ref.read(currentAssessmentProvider.notifier).reset();
            context.go(AppRoutes.home);
          },
          child: Text(l10n.yes),
        ),
      ],
    ),
  );
}
