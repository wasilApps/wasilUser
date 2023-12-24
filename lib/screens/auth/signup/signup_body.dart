// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasil_user/controllers/auth_controller/auth_controller.dart';
import 'package:wasil_user/screens/auth/signup/widget/signup_bottom.dart';
import 'package:wasil_user/screens/auth/signup/widget/signup_title.dart';
import 'package:wasil_user/screens/auth/signup/widget/user_type_widget.dart';

import '../../../utils/app_style.dart';
import '../../../utils/size_config.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../signin/widget/code_country_widget.dart';

class SignUp_Body extends StatefulWidget {
  const SignUp_Body({super.key});

  @override
  State<SignUp_Body> createState() => _SignUp_BodyState();
}

class _SignUp_BodyState extends State<SignUp_Body> {
  AuthController authController = Get.put(AuthController());
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SignUp_Title(),
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
              height: getPercentScreenHeight(1),
            ),
            SizedBox(
              width: getPercentScreenWidth(90),
              child: CustomTextField(
                hint: 'Name',
                controller: nameController,
                keyboardType: TextInputType.text,
                suffixIcon: Icon(
                  Icons.person,
                  color: primaryColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your  Name'.tr;
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: getPercentScreenHeight(1),
            ),
            SizedBox(
              width: getPercentScreenWidth(90),
              child: CustomTextField(
                hint: 'Email',
                controller: emailController,
                keyboardType: TextInputType.text,
                suffixIcon: Icon(
                  Icons.email,
                  color: primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: getPercentScreenHeight(1),
            ),
            UserType(),
            SizedBox(
              height: getPercentScreenHeight(1),
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
              height: getPercentScreenHeight(1),
            ),
            SizedBox(
              width: getPercentScreenWidth(90),
              child: CustomTextField(
                hint: 'Referrer Link',
                controller: linkController,
                keyboardType: TextInputType.text,
                suffixIcon: Icon(
                  Icons.link,
                  color: primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: getPercentScreenHeight(1),
            ),
            CustomButton(
              width: getPercentScreenWidth(90),
              fontSize: 18,
              title: 'Sign Up',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Get.showOverlay(
                      asyncFunction: () => authController
                          .userRegister(
                              nameController.text,
                              '962' + phoneController.text,
                              emailController.text,
                              passwordController.text)
                          .then((value) => authController.userLogin(
                              phoneController.text, passwordController.text)),
                      loadingWidget: Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      ));
                  print('d');
                }
              },
            ),
            SignUpBottom()
          ],
        ),
      ),
    );
  }
}
