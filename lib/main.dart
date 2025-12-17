import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/core/constants/app_routes.dart';
import 'screens/login_Screen.dart';
import 'core/theme/app_theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SCUBE',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: Routes.login,
        routes: {
          Routes.login: (context) => const LoginPage(),
        
        },
    
    );
  }
}
