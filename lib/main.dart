import 'package:flutter/material.dart';
import 'package:sakuku/screen/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sakuku',
      theme: ThemeData(
        primaryColor: const Color(0xFF6A859C),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
