import 'package:dio/dio.dart';
import 'package:movie_app/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org /4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNzAxYmZmYzE4NzFiOTE5YWQzYmQ2NDQ1NGRkZTFlZCIsInN1YiI6IjVkNTYxMGFlYmM4NjU3NGIzNzJkMjA1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.evUVOqQ14FvEYu9mU39AHNUwKaq4A4XtqcspZy3AJPo'
        }
      )
    );
  }

}