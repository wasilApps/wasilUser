// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasil_user/utils/size_config.dart';

import '../../../../utils/app_style.dart';

class SignUp_Title extends StatelessWidget {
  const SignUp_Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(children: [
        SizedBox(
          height: getPercentScreenHeight(5),
        ),
        Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: getPercentScreenWidth(40),
            height: getPercentScreenHeight(10),
          ),
        ),
        SizedBox(
          height: getPercentScreenHeight(5),
        ),
        Row(
          children: [
            Text(
              "Sign Up".tr,
              style: boldPrimary,
            ),
          ],
        ),
        SizedBox(
          height: getPercentScreenHeight(3),
        ),
      ]),
    );
  }
}
