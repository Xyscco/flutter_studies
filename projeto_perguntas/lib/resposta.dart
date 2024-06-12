import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: quandoSelecionado,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          minimumSize: const Size(206, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        child: Text(
          texto,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
