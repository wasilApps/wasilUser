// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wasil_user/screens/address/widget/google_map_widget.dart';

class Add_Address_Body extends StatefulWidget {
  const Add_Address_Body({super.key});

  @override
  State<Add_Address_Body> createState() => _Add_Address_BodyState();
}

class _Add_Address_BodyState extends State<Add_Address_Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GoogleMapWidget(),
      ],
    );
  }
}
