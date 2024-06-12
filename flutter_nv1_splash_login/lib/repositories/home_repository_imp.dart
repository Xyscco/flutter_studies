import 'package:dio/dio.dart';
import 'package:flutter_nv1_splash_login/models/post_model.dart';
import 'package:flutter_nv1_splash_login/repositories/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  @override
  Future<List<PostModel>> getList() async {
    try {
      final dio = Dio();
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      print(e);
    }

    // var value = await rootBundle.loadString('assets/data.json');
    // List postJson = jsonDecode(value);
    // return postJson.map((e) => PostModel.fromJson(e)).toList();

    return [];
  }
}
