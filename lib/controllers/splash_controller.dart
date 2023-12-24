import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wasil_user/routes/routes.dart';
import '../utils/app_style.dart';
import '../utils/connectivity.dart';

class SplashController extends GetxController {
  bool isloading = true;
  final box = GetStorage();
  // final loginController = Get.put(LoginController());

  // @override
  // void onInit() {
  //   super.onInit();
  //   checkAndConnectivity();
  // }

  void checkAndConnectivity() async {
    bool isConnected = await checkInternetConnection();

    if (isConnected) {
      if (box.read('loggedIn') == true) {
        Get.offNamed(AppRoutes.homescreen);
      } else if (box.read('loggedIn') == null ||
          box.read('loggedIn') == false) {
        Get.offNamed(AppRoutes.signinscreen);
      }
      // Perform actions when there is an internet connection
      print('Internet connection available');
    } else {
      Get.showSnackbar(GetSnackBar(
          titleText: Text('No internet connection'.tr,
              style: const TextStyle(
                  fontFamily: 'bold', fontSize: 14, color: whiteColor)),
          messageText: const Text('No internet connection',
              style: TextStyle(
                  fontFamily: 'bold', fontSize: 14, color: whiteColor)),
          duration: const Duration(seconds: 5),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          snackPosition: SnackPosition.BOTTOM,
          icon: IconButton(
              onPressed: () {
                Get.closeCurrentSnackbar();
              },
              icon: const Icon(Icons.check_circle),
              iconSize: 32,
              color: primaryColor),
          backgroundColor: Colors.white.withOpacity(0.8)));
      // Perform actions when there is no internet connection

      print('No internet connection');
    }
  }
}
