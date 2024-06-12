import 'package:flutter/material.dart';

class SecondWidget extends StatefulWidget {
  const SecondWidget({super.key});

  @override
  State<SecondWidget> createState() => _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
  late String valor = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => valor,
    );
  }
}
