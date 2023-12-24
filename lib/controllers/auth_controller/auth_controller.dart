import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wasil_user/routes/routes.dart';

import '../../services/auth_service.dart';
import '../loader_controller.dart';

class AuthController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());
  GetStorage box = GetStorage();
  Future<void> userRegister(String userName, String phoneNumber, String email,
      String password) async {
    loaderController.loading(true);

    var userData = {
      "name": userName,
      "mobile": phoneNumber,
      "password": password,
      // "fcm_token":"",
      "email": email
    };

    try {
      var response = await AuthService().signUp(userData);

      // box.write('personId', personId);
      update();
      Get.offAllNamed(AppRoutes.homescreen);
    } catch (e) {
      print('errorrrrrr${e.toString()}');
    }

    loaderController.loading(false);
  }

  Future<void> userLogin(String phoneNumber, String password) async {
    loaderController.loading(true);

    var userData = {
      "mobile": phoneNumber,
      "password": password,
    };

    try {
      var response = await AuthService().logIn(userData);

      // box.write('personId', personId);
      update();
      Get.offAllNamed(AppRoutes.homescreen);
    } catch (e) {
      print('errorrrrrr${e.toString()}');
    }

    loaderController.loading(false);
  }
}
