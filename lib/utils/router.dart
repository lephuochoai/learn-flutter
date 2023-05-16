import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/layouts/MainLayout/MainLayout.dart';
import 'package:my_app/screens/auth/login/login.dart';
import 'package:my_app/screens/auth/register/register.dart';
import 'package:my_app/screens/home/home.dart';
import 'package:my_app/screens/settings/settings.dart';
import 'package:my_app/screens/splash/splash.dart';
import 'package:my_app/utils/route-utils.dart';

import '../store/index.dart';

class AppRouter {
  late AppState appState;
  AppRouter(this.appState);

  late final GoRouter goRouter = GoRouter(
    refreshListenable: appState,
    debugLogDiagnostics: true,
    initialLocation: AppPage.main.toPath,
    routes: [
      GoRoute(
          name: AppPage.main.toName,
          path: AppPage.main.toPath,
          builder: (context, state) => const MainLayout(),
          redirect: (BuildContext context, GoRouterState state) {
            final isLoggedIn = appState.isLoggedIn;
            if (!isLoggedIn) return AppPage.login.toPath;

            return null;
          },
          routes: [
            GoRoute(
              name: AppPage.home.toName,
              path: AppPage.home.toPath,
              builder: (context, state) => const HomeScreen(),
            ),
            GoRoute(
              name: AppPage.settings.toName,
              path: AppPage.settings.toPath,
              builder: (context, state) => const SettingsScreen(),
            ),
          ]),
      GoRoute(
        name: AppPage.splash.toName,
        path: AppPage.splash.toPath,
        builder: (context, state) => const SplashScreen(),
        // redirect: conditionSplash,
      ),
      GoRoute(
        name: AppPage.login.toName,
        path: AppPage.login.toPath,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: AppPage.register.toName,
        path: AppPage.register.toPath,
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
    redirect: (context, state) {
      final initialized = appState.initialized;
      if (initialized) return AppPage.splash.toPath;
      return null;
    },
  );
}
