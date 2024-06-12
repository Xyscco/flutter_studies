import 'package:flutter/material.dart';
import 'package:flutter_nv1/pages/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // useMaterial3: true,
        primaryColor: Colors.green,
      ),
      home: HomePage(),
    );
  }
}
