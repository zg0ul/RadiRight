import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/assessment/presentation/screens/panel_selection_screen.dart';
import '../../features/assessment/presentation/screens/topic_selection_screen.dart';
import '../../features/assessment/presentation/screens/question_screen.dart';
import '../../features/assessment/presentation/screens/result_screen.dart';
import '../../features/history/presentation/screens/history_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/subscription/presentation/screens/trial_expired_screen.dart';
import '../../features/subscription/presentation/screens/contact_info_screen.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/subscription/presentation/providers/subscription_provider.dart';
import 'routes.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authNotifierProvider);
  final subscriptionState = ref.watch(subscriptionNotifierProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: false,
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull != null;
      final isOnAuthPage = state.matchedLocation == AppRoutes.login || state.matchedLocation == AppRoutes.register;
      final isOnSplash = state.matchedLocation == AppRoutes.splash;
      final isOnTrialExpired = state.matchedLocation == AppRoutes.trialExpired;

      // If still loading auth state or on splash, don't redirect
      if (authState.isLoading || isOnSplash) {
        return null;
      }

      // If not logged in and not on auth page, redirect to login
      if (!isLoggedIn && !isOnAuthPage) {
        return AppRoutes.login;
      }

      // If logged in, check subscription status
      if (isLoggedIn) {
        // If subscription is still loading, wait (don't redirect yet)
        if (subscriptionState.isLoading) {
          return null;
        }

        // If on auth page, check subscription and redirect accordingly
        if (isOnAuthPage) {
          final subscription = subscriptionState.valueOrNull;
          if (subscription == null || !subscription.isActive) {
            return AppRoutes.trialExpired;
          }
          return AppRoutes.home;
        }

        // If on any protected route (not auth pages, not trial expired), check subscription
        if (!isOnAuthPage && !isOnTrialExpired && !isOnSplash) {
          final subscription = subscriptionState.valueOrNull;
          if (subscription == null || !subscription.isActive) {
            return AppRoutes.trialExpired;
          }
        }
      }

      return null;
    },
    routes: [
      GoRoute(path: AppRoutes.splash, name: 'splash', builder: (context, state) => const SplashScreen()),
      GoRoute(path: AppRoutes.login, name: 'login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: AppRoutes.register, name: 'register', builder: (context, state) => const RegisterScreen()),
      GoRoute(path: AppRoutes.home, name: 'home', builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: AppRoutes.panelSelection,
        name: 'panelSelection',
        builder: (context, state) => const PanelSelectionScreen(),
      ),
      GoRoute(
        path: AppRoutes.topicSelection,
        name: 'topicSelection',
        builder: (context, state) {
          final panelId = state.pathParameters['panelId']!;
          return TopicSelectionScreen(panelId: panelId);
        },
      ),
      GoRoute(
        path: AppRoutes.question,
        name: 'question',
        builder: (context, state) {
          final topicId = state.pathParameters['topicId']!;
          return QuestionScreen(topicId: topicId);
        },
      ),
      GoRoute(path: AppRoutes.result, name: 'result', builder: (context, state) => const ResultScreen()),
      GoRoute(path: AppRoutes.history, name: 'history', builder: (context, state) => const HistoryScreen()),
      GoRoute(path: AppRoutes.settings, name: 'settings', builder: (context, state) => const SettingsScreen()),
      GoRoute(
        path: AppRoutes.trialExpired,
        name: 'trialExpired',
        builder: (context, state) => const TrialExpiredScreen(),
      ),
      GoRoute(path: AppRoutes.contactInfo, name: 'contactInfo', builder: (context, state) => const ContactInfoScreen()),
    ],
    errorBuilder: (context, state) => Scaffold(body: Center(child: Text('Page not found: ${state.error}'))),
  );
}
