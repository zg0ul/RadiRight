import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import '../providers/subscription_provider.dart';

class TrialCountdownWidget extends ConsumerWidget {
  const TrialCountdownWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isTrialActive = ref.watch(isTrialActiveProvider);
    final daysRemaining = ref.watch(subscriptionDaysRemainingProvider);

    if (!isTrialActive) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context, daysRemaining),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.timer_outlined,
            size: 16,
            color: _getTextColor(context, daysRemaining),
          ),
          const SizedBox(width: 8),
          Text(
            l10n.daysRemaining(daysRemaining),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: _getTextColor(context, daysRemaining),
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context, int daysRemaining) {
    if (daysRemaining <= 2) {
      return Theme.of(context).colorScheme.errorContainer;
    } else if (daysRemaining <= 4) {
      return Theme.of(context).colorScheme.tertiaryContainer;
    } else {
      return Theme.of(context).colorScheme.primaryContainer;
    }
  }

  Color _getTextColor(BuildContext context, int daysRemaining) {
    if (daysRemaining <= 2) {
      return Theme.of(context).colorScheme.onErrorContainer;
    } else if (daysRemaining <= 4) {
      return Theme.of(context).colorScheme.onTertiaryContainer;
    } else {
      return Theme.of(context).colorScheme.onPrimaryContainer;
    }
  }
}
