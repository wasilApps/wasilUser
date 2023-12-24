import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasil_user/utils/app_style.dart';

import '../../../../utils/size_config.dart';
import '../../signup/signup_screen.dart';

class SigninBottom extends StatelessWidget {
  const SigninBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dont have account'.tr + '?'.tr, style: basicSecondry),
              TextButton(
                  onPressed: () {
                    Get.to(const SignUp_Screen());
                  },
                  child: Text('SignUp Now'.tr, style: basicPrimary))
            ],
          ),
        ),
        Divider(
          color: primaryColor,
          endIndent: getPercentScreenWidth(15),
          indent: getPercentScreenWidth(15),
        ),
        Center(
            child: TextButton(
                onPressed: () {},
                child: Text('Forgot Password'.tr, style: basicPrimary)))
      ],
    );
  }
}
