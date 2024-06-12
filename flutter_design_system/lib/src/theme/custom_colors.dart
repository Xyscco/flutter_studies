import 'package:flutter/material.dart';

class CustomColors {
  // Cores utilizadas no seu projeto.
  final Color primary;
  final Color primaryDark;
  final Color secondary1;
  final Color secondary2;
  final Color secondary3;

  const CustomColors({
    this.primary = const Color.fromARGB(255, 110, 255, 114),
    this.primaryDark = const Color.fromARGB(255, 66, 128, 69),
    this.secondary1 = const Color.fromARGB(255, 122, 255, 202),
    this.secondary2 = const Color.fromARGB(255, 226, 135, 255),
    this.secondary3 = const Color.fromARGB(255, 255, 112, 84),
  });
}
