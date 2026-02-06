import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../app/routing/routes.dart';
import '../constants/app_constants.dart';
import '../constants/app_icons.dart';

class AppScaffold extends ConsumerWidget {
  final Widget child;
  final String? title;
  final bool centerTitle;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? customAppBar;
  final bool showBackButton;
  final bool showContentPadding;
  final ScrollController? scrollController;

  final VoidCallback? onBackButtonPressed;

  /// When `onRefresh` is not null, it adds a refresh indicator with the onRefresh callback
  final Future<void> Function()? onRefresh;

  final List<Widget>? footerButtons;
  final AlignmentDirectional? footerAlignment;
  final BoxDecoration? footerDecoration;

  /// Route to navigate to when back button is pressed but can't pop
  /// Defaults to home screen. Set to AppRoutes.login for unauthenticated screens.
  final String fallbackRoute;

  const AppScaffold({
    super.key,
    required this.child,
    this.bottomNavigationBar,
    this.customAppBar,
    this.title,
    this.centerTitle = true,
    this.actions,
    this.leading,
    this.showBackButton = true,
    this.showContentPadding = true,
    this.scrollController,
    this.onRefresh,
    this.onBackButtonPressed,
    this.footerButtons,
    this.footerAlignment,
    this.footerDecoration,
    this.fallbackRoute = AppRoutes.home,
  }) : assert(!(title != null && customAppBar != null), 'title and customAppBar cannot be used together'),
       assert(!(showBackButton && leading != null), 'showBackButton and leading cannot be used together');

  Widget buildBackButton(BuildContext context) {
    final canGoBack = context.canPop();
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () {
        if (onBackButtonPressed != null) {
          onBackButtonPressed!();
        } else if (canGoBack) {
          context.pop();
        } else {
          context.go(fallbackRoute);
        }
      },
      icon: HugeIcon(
        icon: canGoBack ? AppIcons.back : AppIcons.close,
        color: theme.colorScheme.onSurface,
        size: AppConstants.iconMD,
      ),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      actions: actions,
      leading: leading ?? (showBackButton ? buildBackButton(context) : null),
      title: title != null
          ? MediaQuery.withClampedTextScaling(
              maxScaleFactor: 1.0,
              child: Text(
                title!,
                maxLines: 2,
                overflow: TextOverflow.visible,
                softWrap: true,
                textAlign: centerTitle ? TextAlign.center : TextAlign.start,
              ),
            )
          : null,
      centerTitle: centerTitle,
      titleTextStyle: theme.textTheme.titleMedium,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: theme.colorScheme.surface,
      actionsPadding: EdgeInsetsDirectional.only(end: AppConstants.spacingSM),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget content = onRefresh != null
        ? RefreshIndicator.adaptive(
            onRefresh: onRefresh!,
            child: Padding(
              padding: showContentPadding ? EdgeInsets.symmetric(horizontal: AppConstants.spacingMD) : EdgeInsets.zero,
              child: child,
            ),
          )
        : Padding(
            padding: showContentPadding ? EdgeInsets.symmetric(horizontal: AppConstants.spacingMD) : EdgeInsets.zero,
            child: child,
          );

    if (scrollController != null) {
      content = Scrollbar(
        controller: scrollController,
        thumbVisibility: false,
        trackVisibility: false,
        thickness: 2.0.w,
        interactive: true,
        radius: Radius.circular(2.0.r),
        child: content,
      );
    }

    return Scaffold(
      appBar: customAppBar ?? buildAppBar(context),
      backgroundColor: Theme.of(context).colorScheme.surface,
      // Prevent bottom sheet/keyboard from resizing the nav bar
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // Main content area - takes up all available space above nav bar
          Expanded(
            child: SafeArea(
              // Don't add bottom padding since we have our own nav bar
              bottom: false,
              child: content,
            ),
          ),
        ],
      ),
      persistentFooterButtons: footerButtons,
      persistentFooterAlignment: footerAlignment ?? AlignmentDirectional.bottomCenter,
      persistentFooterDecoration: footerDecoration ?? BoxDecoration(color: Theme.of(context).colorScheme.surface),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
