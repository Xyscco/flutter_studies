import 'package:flutter/material.dart';

class WidgetModel {
  String idWidget;
  String descricao;
  Widget widget;
  bool ativo;

  WidgetModel({
    required this.idWidget,
    required this.descricao,
    required this.widget,
    required this.ativo
  });
}
