import 'package:flutter/material.dart';
import 'package:radi_right/l10n/app_localizations.dart';
import 'package:radi_right/shared/widgets/app_logo.dart';
import 'package:radi_right/core/utils/app_spacer.dart';

class HomeHeroSection extends StatelessWidget {
  const HomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Column(
      children: [
        const AppLogo(),
        AppSpacer.verticalMD,
        Text(
          l10n.appName,
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        AppSpacer.verticalSM,
        Text(
          l10n.homeTagline,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
