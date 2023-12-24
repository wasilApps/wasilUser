// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'signup_body.dart';

class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({super.key});

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUp_Body(),
    );
  }
}
