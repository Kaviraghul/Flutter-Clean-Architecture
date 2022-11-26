import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/splash/splash.dart';

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
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.forgotPasswardRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_) => 
       Scaffold(
        appBar: AppBar(title: const Text("No route found")),
       )
    );
  }
}