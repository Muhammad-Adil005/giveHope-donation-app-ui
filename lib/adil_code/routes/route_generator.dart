import 'package:flutter/material.dart';

import '../screens/screens.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AdilRoutes.initial:
        return _createRoute(const SplashScreen());

      case AdilRoutes.introViewScreen:
        return _createRoute(const IntroViewScreen());

      case AdilRoutes.signUpScreen:
        return _createRoute(const SignUpScreen());

      case AdilRoutes.signInScreen:
        return _createRoute(const SignInScreen());

      case AdilRoutes.forGotPasswordScreen:
        return _createRoute(const ForgetPasswordScreen());

      case AdilRoutes.phoneNumberScreen:
        return _createRoute(const PhoneNumberScreen());

      case AdilRoutes.otpVerificationScreen:
        return _createRoute(const OPTVerificationScreen());

      case AdilRoutes.newPasswordScreen:
        return _createRoute(const NewPasswordScreen());

      case AdilRoutes.happyScreen:
        return _createRoute(const HappyScreen());

      case AdilRoutes.homeScreen:
        return _createRoute(const HomeScreen());

      case AdilRoutes.profileScreen:
        return _createRoute(const ProfileScreen());

      case AdilRoutes.contactUsScreen:
        return _createRoute(const ContactUsScreen());

      case AdilRoutes.notificationScreen:
        return _createRoute(NotificationScreen());

      case AdilRoutes.paymentScreen:
        return _createRoute(const PaymentScreen());
      default:
        return _errorRoute();
    }
  }

  // Helper function to create a smooth animated route
  static PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut; // Smooth curve for both entry and exit

        var slideAnimation = Tween<Offset>(
          begin: const Offset(0.0, 1.0), // Slide from bottom to top
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: curve,
        ));

        var fadeAnimation = Tween<double>(
          begin: 0.0, // Fade from transparent
          end: 1.0, // To fully visible
        ).animate(CurvedAnimation(
          parent: animation,
          curve: curve,
        ));

        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 700),
      reverseTransitionDuration: const Duration(milliseconds: 700),
    );
  }

  // Error route in case of invalid route names
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
