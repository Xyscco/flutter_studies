// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class LoginController {
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value;

  String? _senha;
  setSenha(String value) => _senha = value;

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(const Duration(seconds: 2));
    inLoader.value = false;
    return _login == 'admin' && _senha == '123';
  }
}
