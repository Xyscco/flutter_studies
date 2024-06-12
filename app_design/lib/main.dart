import 'package:app_design/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const theme = CustomTheme();
    return MaterialApp(
      title: 'Flutter App Design',
      debugShowCheckedModeBanner: false,
      theme: theme.buildTheme(),
      home: const HomePage(),
    );
  }
}
