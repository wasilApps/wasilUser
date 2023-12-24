// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:wasil_user/screens/auth/signin/signin_body.dart';

class Signin_Screen extends StatefulWidget {
  const Signin_Screen({super.key});

  @override
  State<Signin_Screen> createState() => _Signin_ScreenState();
}

class _Signin_ScreenState extends State<Signin_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Signin_Body(),
    );
  }
}
