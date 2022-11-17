import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech/presentation/pages/product_details/product_details_screen.dart';

import '../../injector.dart';
import '../../presentation/blocs/login_bloc/login_bloc.dart';
import '../../presentation/blocs/signup_bloc/signup_bloc.dart';
import '../../presentation/blocs/category_listing_bloc/category_listing_bloc.dart';
import '../../presentation/pages/dashboard/dashboard_screen.dart';
import '../../presentation/pages/login/login_screen.dart';
import '../../presentation/pages/onboarding_screen.dart';
import '../../presentation/pages/signup/otp_screen.dart';
import '../../presentation/pages/signup/signup_screen.dart';
import '../../presentation/pages/signup/signup_success_screen.dart';
import '../../presentation/pages/welcome_screen.dart';
import '../../presentation/pages/splash_screen.dart';
import '../../presentation/pages/category_listing/category_listing_screen.dart';
import '../../presentation/pages/notification/notification_screen.dart';
import 'navigation_constants.dart';

class NavigationUtils {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case routeOnboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
          settings: settings,
        );
      case routeWelcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
          settings: settings,
        );
      case routeLogin:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => Injector.resolve<LoginBloc>(),
            child: const LoginScreen(),
          ),
          settings: settings,
        );
      case routeSignUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => Injector.resolve<SignupBloc>(),
            child: const SignUpScreen(),
          ),
          settings: settings,
        );
      case routeOTP:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => Injector.resolve<SignupBloc>(),
            child: const OTPScreen(),
          ),
          settings: settings,
        );
      case routeSignupSuccess:
        return MaterialPageRoute(
          builder: (_) => const SignupSuccessScreen(),
          settings: settings,
        );
      case routeDashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
          settings: settings,
        );
      case routeCategoryListing:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => Injector.resolve<CategoryListingBloc>(),
            child: const CategoryListingScreen(),
          ),
          settings: settings,
        );
      case routeNotification:
        return MaterialPageRoute(
          builder: (_) => NotificationScreen(),
          settings: settings,
        );
      case routeProductDetails:
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(
            productEntity: args!['product_entity'],
          ),
          settings: settings,
        );
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
