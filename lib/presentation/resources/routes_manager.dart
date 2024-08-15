import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/main/home/home_screen.dart';
import 'package:flutter_clean_architecture/presentation/main/main_view.dart';
import 'package:flutter_clean_architecture/presentation/main/settings/settings_page.dart';
import 'package:flutter_clean_architecture/presentation/onboarding/onboarding.dart';
import 'package:flutter_clean_architecture/presentation/splash/splash.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswardRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String homeRoute = "home";
  static const String settingsRoute = "settings";
}

class AppRoutes {
  final String? initRoute;
  late GoRouter router;

  AppRoutes({required this.initRoute}) {
    router = GoRouter(
      // initialLocation: initRoute ?? '/',
      initialLocation: Routes.mainRoute,

      routes: <RouteBase>[
        GoRoute(
          path: Routes.splashRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const SplashView();
          },
        ),
        GoRoute(
          path: Routes.onBoardingRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const OnboardingView();
          },
        ),
        GoRoute(
          path: Routes.mainRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const MainView();
          },
          routes: <RouteBase>[
            GoRoute(
              path: Routes.homeRoute,
              builder: (BuildContext context, GoRouterState state) {
                return const HomePage();
              },
            ),
            GoRoute(
              path: Routes.settingsRoute,
              builder: (BuildContext context, GoRouterState state) {
                return const SettingsPage();
              },
            ),
          ],
        ),
      ],
    );
  }
}
