import 'package:flutter/material.dart';
import 'package:flutter_nv1_splash_login/controllers/login_controller.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController loginController;
  const CustomLoginButtonComponent({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.inLoader,
      builder: (_, inLoader, __) => inLoader
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                loginController.auth().then((result) {
                  if (result) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('snack'),
                        duration: const Duration(seconds: 3),
                        action: SnackBarAction(
                          label: 'ACTION',
                          onPressed: () {},
                        ),
                      ),
                    );
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background branco
                minimumSize: const Size(300, 40), // Tamanho especificado
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}
