import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/forgot_password/forgot_password.dart';
import 'package:flutter_clean_architecture/presentation/login/login.dart';
import 'package:flutter_clean_architecture/presentation/main/main_view.dart';
import 'package:flutter_clean_architecture/presentation/onboarding/onboarding.dart';
import 'package:flutter_clean_architecture/presentation/register/register.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/splash/splash.dart';
import 'package:flutter_clean_architecture/presentation/store_details/store_details.dart';

class Routes {
  static const String splashRoute         = "/";
  static const String onBoardingRoute     = "/onBoarding";
  static const String loginRoute          = "/login";
  static const String registerRoute       = "/register";
  static const String forgotPasswardRoute = "/forgotPassword";
  static const String mainRoute           = "/main";
  static const String storeDetailsRoute   = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswardRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_) => 
       Scaffold(
        appBar: AppBar(title: const Text(AppString.noRouteFound)),
        body: const Center(child: Text(AppString.noRouteFound)),
       )
    );
  }
}