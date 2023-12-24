// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

import 'add_address_body.dart';

class Add_Address_page extends StatefulWidget {
  const Add_Address_page({super.key});

  @override
  State<Add_Address_page> createState() => _Add_Address_pageState();
}

class _Add_Address_pageState extends State<Add_Address_page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Add_Address_Body(),
      ),
    );
  }
}
