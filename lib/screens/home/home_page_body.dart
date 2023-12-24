// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import 'package:wasil_user/controllers/google_map_controller.dart';
import 'package:wasil_user/screens/address/widget/google_map_widget.dart';

class Home_Page_Body extends StatefulWidget {
  const Home_Page_Body({super.key});

  @override
  State<Home_Page_Body> createState() => _Home_Page_BodyState();
}

class _Home_Page_BodyState extends State<Home_Page_Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GoogleMapWidget(),
      ],
    );
  }
}
