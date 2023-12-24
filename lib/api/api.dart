import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wasil_user/api/app_config.dart';

class Api {
  final dio = createDio;
  final tokenDio = Dio(BaseOptions(baseUrl: appConfig));
  final authDio = createAuthDio;

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio get createDio {
    var dio = Dio(BaseOptions(
      baseUrl: appConfig,
      receiveTimeout: const Duration(seconds: 25),
      connectTimeout: const Duration(seconds: 25),
      sendTimeout: const Duration(seconds: 25),
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }

  static Dio get createAuthDio {
    var authDio = Dio(BaseOptions(
      baseUrl: appConfig,
      receiveTimeout: const Duration(seconds: 20), // 20 seconds
      connectTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
    ));

    // authDio.interceptors.addAll({
    //   AppInterceptors(authDio),
    // });
    return authDio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio? dio;
  final box = GetStorage();
  // LoaderController loaderController = Get.put(LoaderController());

  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = box.read('token');
    print('token is ${token}');

    if (token == null || token.isEmpty) {
      options.headers = {
        "accept": "*/*",
        "Content-Type": "application/json",
      };
      print('not auth');
    } else if (token.isNotEmpty || token != null) {
      options.headers = {
        "accept": "*/*",
        "Authorization": "bearer $token",
        // "Content-Type": "application/json",
      };
    }

    return handler.next(options);
  }

  @override
  void onResponse(
    response,
    ResponseInterceptorHandler handler,
  ) {
    print(
      'RESPONSE[${response.statusCode}] => Data: ${response.data}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // LoaderController loaderController = Get.put(LoaderController());
    // MessagesHandlerController msgController =
    //     Get.put(MessagesHandlerController());
    // LoginController loginController = Get.put(LoginController());

    print(
      'ERROR[${err.response!.statusCode}] => PATH: ${err.response!.data}',
    );

    if (err.response!.statusCode == 401) {
      // // loginController.getRefreshToken();

      // return handler.resolve(err.response!);
    } else if (err.response!.statusCode == 403) {
      // loginController.getRefreshToken();
    } else if (err.response!.statusCode == 500) {
      // msgController.showErrorMessage('Server error'.tr);
    }

    // handler.resolve(err.response!);

    return handler.next(err);
  }
}
