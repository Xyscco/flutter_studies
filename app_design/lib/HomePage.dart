import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = CustomTheme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'App Design',
          style: theme.fontStyle.titleMedium.cl(Colors.black87),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Using style title medium',
                style: theme.fontStyle.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(
                'Using style title medium with fs 20',
                style: theme.fontStyle.titleMedium.fs(20),
              ),
              const SizedBox(height: 4),
              Text(
                'Using style body medium',
                style: theme.fontStyle.bodyMedium,
              ),
              const Spacer(),
              const CustomTextField(hintText: "Enter text"),
              const SizedBox(height: 12),
              const CustomTextField(
                hintText: "Enter text",
                suffixIcon: Icon(Icons.lock),
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {},
                title: 'Button primary',
              ),
              const SizedBox(height: 12),
              CustomButton(
                onPressed: () {},
                title: 'Button secondary 3',
                backgroundColor: theme.colors.secondary3,
              ),
              const SizedBox(height: 12),
              CustomButton(
                onPressed: () {},
                title: 'Button with icon',
                backgroundColor: theme.colors.secondary2,
                iconData: Icons.timer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
