import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/layouts/MainLayout/MainLayout.dart';
import 'package:my_app/screens/auth/login/login.dart';
import 'package:my_app/screens/home/home.dart';
import 'package:my_app/screens/settings/settings.dart';
import 'package:my_app/screens/splash/splash.dart';
import 'package:my_app/store/index.dart';
import 'package:my_app/utils/route-utils.dart';
import 'package:provider/provider.dart';

final GoRouter router = GoRouter(
    initialLocation: APP_PAGE.home.toPath,
    routes: [
      GoRoute(
        name: APP_PAGE.main.toName,
        path: APP_PAGE.main.toPath,
        builder: (context, state) => const MainLayout(),
      ),
      GoRoute(
        name: APP_PAGE.home.toName,
        path: APP_PAGE.home.toPath,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: APP_PAGE.login.toName,
        path: APP_PAGE.login.toPath,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: APP_PAGE.splash.toName,
        path: APP_PAGE.splash.toPath,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: APP_PAGE.settings.toName,
        path: APP_PAGE.settings.toPath,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final appState = context.watch<AppState>();
      final isLoggedIn = appState.isLoggedIn;
      final initialized = appState.initialized;

      final loginScreen = state.namedLocation(APP_PAGE.login.toName);
      final mainLayout = state.namedLocation(APP_PAGE.main.toName);
      final splashScreen = state.namedLocation(APP_PAGE.splash.toName);

      if (initialized == true) return splashScreen;
      if (isLoggedIn != true) return loginScreen;

      return mainLayout;
    });
