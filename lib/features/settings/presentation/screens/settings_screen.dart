import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import '../../../../app/routing/routes.dart';
import '../../../../app/theme/theme_provider.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../subscription/presentation/providers/subscription_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final themeMode = ref.watch(themeModeNotifierProvider);
    final locale = ref.watch(localeNotifierProvider);
    final authState = ref.watch(authNotifierProvider);
    final subscriptionState = ref.watch(subscriptionNotifierProvider);

    final user = authState.valueOrNull;
    final subscription = subscriptionState.valueOrNull;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        children: [
          // Profile Section
          _buildSectionHeader(context, l10n.profile),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            title: Text(user?.name ?? user?.email ?? ''),
            subtitle: Text(user?.email ?? ''),
          ),
          const Divider(),

          // Subscription Section
          _buildSectionHeader(context, l10n.subscription),
          ListTile(
            leading: Icon(
              subscription?.isActive == true
                  ? Icons.check_circle
                  : Icons.warning,
              color: subscription?.isActive == true
                  ? Colors.green
                  : Theme.of(context).colorScheme.error,
            ),
            title: Text(l10n.subscriptionStatus),
            subtitle: Text(
              subscription?.isActive == true
                  ? '${subscription!.tier.displayName} - ${l10n.daysRemaining(subscription.daysRemaining)}'
                  : l10n.subscriptionExpired,
            ),
            trailing: TextButton(
              onPressed: () => context.push(AppRoutes.contactInfo),
              child: Text(l10n.contactUs),
            ),
          ),
          const Divider(),

          // Language Section
          _buildSectionHeader(context, l10n.language),
          RadioListTile<Locale>(
            title: Text(l10n.english),
            value: const Locale('en'),
            groupValue: locale,
            onChanged: (value) {
              if (value != null) {
                ref.read(localeNotifierProvider.notifier).setLocale(value);
              }
            },
          ),
          RadioListTile<Locale>(
            title: Text(l10n.arabic),
            value: const Locale('ar'),
            groupValue: locale,
            onChanged: (value) {
              if (value != null) {
                ref.read(localeNotifierProvider.notifier).setLocale(value);
              }
            },
          ),
          const Divider(),

          // Theme Section
          _buildSectionHeader(context, l10n.theme),
          RadioListTile<ThemeMode>(
            title: Text(l10n.lightTheme),
            value: ThemeMode.light,
            groupValue: themeMode,
            onChanged: (value) {
              if (value != null) {
                ref.read(themeModeNotifierProvider.notifier).setThemeMode(value);
              }
            },
          ),
          RadioListTile<ThemeMode>(
            title: Text(l10n.darkTheme),
            value: ThemeMode.dark,
            groupValue: themeMode,
            onChanged: (value) {
              if (value != null) {
                ref.read(themeModeNotifierProvider.notifier).setThemeMode(value);
              }
            },
          ),
          RadioListTile<ThemeMode>(
            title: Text(l10n.systemTheme),
            value: ThemeMode.system,
            groupValue: themeMode,
            onChanged: (value) {
              if (value != null) {
                ref.read(themeModeNotifierProvider.notifier).setThemeMode(value);
              }
            },
          ),
          const Divider(),

          // Logout
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              l10n.logout,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            onTap: () => _showLogoutConfirmation(context, ref, l10n),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  void _showLogoutConfirmation(
      BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.logout),
        content: Text(l10n.logoutConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await ref.read(authNotifierProvider.notifier).signOut();
              if (context.mounted) {
                context.go(AppRoutes.login);
              }
            },
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
  }
}
