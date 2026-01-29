import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import '../../../../app/config/app_config.dart';

class ContactInfoScreen extends ConsumerWidget {
  const ContactInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.contactUs),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.contact_support_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              l10n.contactForSubscription,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _buildContactCard(
              context,
              icon: Icons.email_outlined,
              title: l10n.contactEmail,
              value: AppConfig.contactEmail,
              onCopy: () => _copyToClipboard(context, AppConfig.contactEmail, l10n),
            ),
            const SizedBox(height: 16),
            _buildContactCard(
              context,
              icon: Icons.phone_outlined,
              title: l10n.contactPhone,
              value: AppConfig.contactPhone,
              onCopy: () => _copyToClipboard(context, AppConfig.contactPhone, l10n),
            ),
            const SizedBox(height: 32),
            _buildSubscriptionInfo(context, l10n),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onCopy,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 32,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.6),
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onCopy,
              icon: const Icon(Icons.copy),
              tooltip: 'Copy',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionInfo(BuildContext context, AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.subscription,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildPriceRow(
              context,
              title: l10n.monthly,
              price: '\$${AppConfig.monthlyPrice.toStringAsFixed(0)}/month',
            ),
            const SizedBox(height: 12),
            _buildPriceRow(
              context,
              title: l10n.yearly,
              price: '\$${AppConfig.yearlyPrice.toStringAsFixed(0)}/year',
              highlight: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(
    BuildContext context, {
    required String title,
    required String price,
    bool highlight = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: highlight
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            price,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: highlight
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
          ),
        ],
      ),
    );
  }

  void _copyToClipboard(
      BuildContext context, String text, AppLocalizations l10n) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.copiedToClipboard),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
