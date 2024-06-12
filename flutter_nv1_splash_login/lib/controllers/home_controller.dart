import 'package:flutter/material.dart';
import 'package:flutter_nv1_splash_login/models/post_model.dart';
import 'package:flutter_nv1_splash_login/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);

  fetch() async {
    posts.value = await _homeRepository.getList();
  }
}
