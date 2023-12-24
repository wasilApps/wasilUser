// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wasil_user/controllers/auth_controller/auth_controller.dart';
import 'package:wasil_user/routes/routes.dart';
import 'package:wasil_user/screens/auth/signin/widget/code_country_widget.dart';
import 'package:wasil_user/screens/auth/signin/widget/signin_bottom.dart';
import 'package:wasil_user/screens/auth/signin/widget/signin_title.dart';
import 'package:wasil_user/utils/app_style.dart';
import 'package:wasil_user/utils/size_config.dart';
import 'package:wasil_user/widgets/custom_button.dart';
import 'package:wasil_user/widgets/custom_text_field.dart';

class Signin_Body extends StatefulWidget {
  const Signin_Body({super.key});

  @override
  State<Signin_Body> createState() => _Signin_BodyState();
}

class _Signin_BodyState extends State<Signin_Body> {
  AuthController authController = Get.put(AuthController());
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Signin_Title(),
            SizedBox(
              width: getPercentScreenWidth(90),
              child: CustomTextField(
                hint: 'Phone Number',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                suffixIcon: Icon(
                  Icons.phone_android,
                  color: primaryColor,
                ),
                prefixIcon: CodeCountry(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number'.tr;
                  }
                  if (value.length != 9) {
                    return 'mobile number not equal 9 '.tr;
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: getPercentScreenHeight(3),
            ),
            SizedBox(
              width: getPercentScreenWidth(90),
              child: CustomTextField(
                hint: 'Password',
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: _showPassword,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  child: Icon(
                    _showPassword == true
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: primaryColor,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your  password'.tr;
                  }
                  if (value.length < 8) {
                    return 'password length at least 8 character'.tr;
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: getPercentScreenHeight(3),
            ),
            CustomButton(
              width: getPercentScreenWidth(90),
              fontSize: 18,
              title: 'Sign In',
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                //   Get.showOverlay(
                //       asyncFunction: () => authController.userLogin(
                //           '962' + phoneController.text,
                //           passwordController.text),
                //       loadingWidget: Center(
                //         child: CircularProgressIndicator(
                //           color: primaryColor,
                //         ),
                //       ));
                //   print('d');
                // }
                Get.toNamed(AppRoutes.homescreen);
              },
            ),
            SizedBox(
              height: getPercentScreenHeight(3),
            ),
            SigninBottom()
          ],
        ),
      ),
    );
  }
}
