import 'dart:developer';

import 'package:dio/dio.dart';

import '../api/api.dart';

class AuthService {
  static AuthService? _instance;

  var dio = Dio();
  factory AuthService() => _instance ??= AuthService._();

  AuthService._();

  Future<dynamic> logIn([dynamic data]) async {
    try {
      var res = await Api().dio.post('api/v1/user/login', data: data);

      if (res.statusCode == 200 || res.data != null) {
        print('ooooooooooooo${res.data}');
        return res;
      } else if (res.statusCode == 200 || res.data == null) {
      } else if (res.statusCode != 200) {
        log(res.statusCode.toString());
      }
    } catch (e) {
      if (e is DioException) {
        log(
          e.response!.data,
        );
      } else {
        print('errorrrrrr');
      }
    }
  }

  Future<dynamic> signUp([dynamic data]) async {
    try {
      var res = await Api().dio.post('api/v1/user/register', data: data);

      if (res.statusCode == 200 || res.data != null) {
        print('ooooooooooooo${res.data}');
        return res;
      } else if (res.statusCode == 200 || res.data == null) {
      } else if (res.statusCode != 200) {
        log(res.statusCode.toString());
      }
    } catch (e) {
      if (e is DioException) {
        log(e.response!.data, name: 'dadadasdasdadasdx');
      } else {
        print('errorrrrrr');
      }
    }
  }
}
