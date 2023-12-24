// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wasil_user/utils/app_style.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.keyboardType,
      this.hint,
      this.controller,
      this.validator,
      this.focusNode,
      this.onChange,
      this.suffixIcon,
      this.obscureText = false,
      this.prefixIcon,
      this.onTap});
  TextEditingController? controller = TextEditingController();
  TextInputType? keyboardType;
  String? hint;
  FocusNode? focusNode;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool obscureText = false;

  final String? Function(String?)? validator;
  Function(String)? onChange;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(color: Color(0xffdcdee3), width: 1.5));
    return TextFormField(
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChange,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      onTap: onTap,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: hint,
          labelStyle: greybasic,
          // hintText: hint,
          hintStyle: greybasic,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder),
    );
  }
}
