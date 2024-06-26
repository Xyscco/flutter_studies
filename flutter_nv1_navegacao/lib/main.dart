import 'package:flutter/material.dart';
import 'package:flutter_nv1_navegacao/one_page.dart';
import 'package:flutter_nv1_navegacao/two_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnePage(),
        '/twoPage': (context) => const TwoPage()
      },
    );
  }
}
