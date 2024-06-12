import 'package:flutter/material.dart';
// import 'package:flutter_nv1_navegacao/two_page.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => const TwoPage(),
            //   ),
            // );
            Navigator.of(context)
                .pushReplacementNamed('/twoPage', arguments: '123')
                .then(
                  (value) => print(value),
                );
          },
          child: const Text('Ir para Segunda Page'),
        ),
      ),
    );
  }
}
