import 'package:flutter/material.dart';
import 'package:medtech/presentation/pages/login/login_screen.dart';
import 'package:medtech/presentation/pages/onboarding_screen.dart';
import 'package:medtech/presentation/pages/welcome_screen.dart';

import '../../presentation/pages/splash_screen.dart';
import 'navigation_constants.dart';

class NavigationUtils {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case routeOnboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case routeWelcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case routeLogin:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case routeSignUp:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      default:
        return _errorRoute("Coming soon...");
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(title: const Text('Under Development')),
          body: Center(child: Text(message)));
    });
  }

  static Future<dynamic> pushReplacement(BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.of(context)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> push(BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static void pop(BuildContext context, {dynamic args}) {
    Navigator.of(context).pop(args);
  }

  static Future<dynamic> pushAndRemoveUntil(
      BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }
}
