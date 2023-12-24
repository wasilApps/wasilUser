import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasil_user/utils/app_style.dart';
import '../../controllers/splash_controller.dart';
import '../../utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  final splashController = Get.put(SplashController());
  startTime() async {
    var duration = const Duration(seconds: 5);
    // var duration = await splashController.route();
    return Timer(duration, (() => splashController.checkAndConnectivity()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
        width: getPercentScreenWidth(100),
        decoration: const BoxDecoration(
          color: whiteColor,
        ),
        child: Center(
          child: Image.asset('assets/images/logo.png'),
        ));
  }
}
