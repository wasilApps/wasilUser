// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wasil_user/utils/app_style.dart';
import 'package:wasil_user/utils/size_config.dart';

class CustomButton extends StatefulWidget {
  CustomButton(
      {super.key,
      required this.fontSize,
      required this.title,
      this.onPressed,
      this.width});
  String title;
  double fontSize;
  double? width;
  Function()? onPressed;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: primaryColor,
            offset: Offset.infinite,
            blurStyle: BlurStyle.solid),
      ]),
      width: widget.width,
      height: getPercentScreenHeight(6),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            textStyle: const TextStyle(color: whiteColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            )),
        onPressed: widget.onPressed,
        child: Text(widget.title,
            style: TextStyle(
                fontSize: widget.fontSize,
                color: Colors.white,
                fontFamily: 'Baloo',
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
