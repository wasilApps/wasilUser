import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasil_user/utils/app_style.dart';

import '../../../../utils/size_config.dart';
import '../../signin/signin_screen.dart';
import '../../signup/signup_screen.dart';

class SignUpBottom extends StatelessWidget {
  const SignUpBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already Have An Account'.tr + '?'.tr, style: basicSecondry),
              TextButton(
                  onPressed: () {
                    Get.to(const Signin_Screen());
                  },
                  child: Text('Sign In'.tr, style: basicPrimary))
            ],
          ),
        ),
        Divider(
          color: primaryColor,
          endIndent: getPercentScreenWidth(15),
          indent: getPercentScreenWidth(15),
        ),
      ],
    );
  }
}
