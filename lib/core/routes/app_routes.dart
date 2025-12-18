import 'package:flutter/material.dart';
import 'package:task_app/screens/dashboard/dashboard.dart';
import 'package:task_app/screens/data_view/data_view.dart';
import 'package:task_app/screens/empty_screen.dart';
import 'package:task_app/screens/login/login_Screen.dart';

class Routes {
  Routes._();
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String dataViewScreen = '/data_view_screen';
  static const String emptyScreen = '/empty_screen';
}

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return _buildPageTransition(
          settings: settings,
          page: const LoginPage(),
        );

      case Routes.dashboard:
        return _buildPageTransition(
          settings: settings,
          page: const Dashboard(),
        );

      case Routes.dataViewScreen:
        return _buildPageTransition(
          settings: settings,
          page: const DataViewScreen(),
        );

      case Routes.emptyScreen:
        return _buildPageTransition(
          settings: settings,
          page: const EmptyScreen(),
        );

      default:
        return _buildPageTransition(
          settings: settings,
          page: const LoginPage(),
        );
    }
  }

  static PageRouteBuilder _buildPageTransition({
    required RouteSettings settings,
    required Widget page,
    Duration duration = const Duration(milliseconds: 400),
  }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic)),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      transitionDuration: duration,
      reverseTransitionDuration: duration,
    );
  }
}


extension NavigationExtension on BuildContext {
  Future<T?> navigateTo<T>(String routeName, {Object? arguments}) {
    return Navigator.pushNamed<T>(this, routeName, arguments: arguments);
  }



  Future<T?> navigateAndRemoveUntil<T>(
    String routeName, {
    Object? arguments,
    required bool Function(Route<dynamic>) predicate,
  }) {
    return Navigator.pushNamedAndRemoveUntil<T>(
      this,
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  void popScreen<T>({T? result}) {
    Navigator.pop<T>(this, result);
  }
}