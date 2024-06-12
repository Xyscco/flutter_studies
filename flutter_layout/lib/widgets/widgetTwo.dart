import 'package:flutter/material.dart';

class WidgetTwo extends StatefulWidget {
  const WidgetTwo({super.key});

  @override
  State<WidgetTwo> createState() => _WidgetTwoState();
}

class _WidgetTwoState extends State<WidgetTwo> {
  late String valor = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => valor,
    );
  }
}
