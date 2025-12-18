import 'package:flutter/material.dart';
import 'package:task_app/core/routes/app_routes.dart';
import 'screens/login/login_Screen.dart';

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
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.blue),
      home: const LoginPage(),
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: Routes.login,
    );
  }
}
