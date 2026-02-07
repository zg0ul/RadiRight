import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:radi_right/app/routing/routes.dart';
import 'package:radi_right/core/constants/app_constants.dart';
import 'package:radi_right/core/constants/app_icons.dart';
import 'package:radi_right/core/utils/app_spacer.dart';
import 'package:radi_right/l10n/app_localizations.dart';

/// Error state displayed when assessment fails
class QuestionErrorState extends StatelessWidget {
  final AppLocalizations l10n;
  final String error;

  const QuestionErrorState({super.key, required this.l10n, required this.error});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: HugeIcon(icon: AppIcons.back, size: AppConstants.iconMD, color: theme.colorScheme.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.question),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.spacingLG),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HugeIcon(icon: AppIcons.error, size: AppConstants.iconXL, color: theme.colorScheme.error),
              AppSpacer.verticalMD,
              Text(l10n.somethingWentWrong, style: theme.textTheme.titleMedium),
              AppSpacer.verticalSM,
              Text(
                error,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error),
                textAlign: TextAlign.center,
              ),
              AppSpacer.verticalLG,
              ElevatedButton.icon(
                onPressed: () => context.go(AppRoutes.home),
                icon: HugeIcon(icon: AppIcons.home, size: AppConstants.iconSM, color: theme.colorScheme.onPrimary),
                label: Text(
                  l10n.home,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(minimumSize: Size(120.w, AppConstants.buttonHeightMD)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
