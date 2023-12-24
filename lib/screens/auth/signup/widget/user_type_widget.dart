import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasil_user/utils/size_config.dart';

import '../../../../utils/app_style.dart';

class UserType extends StatefulWidget {
  const UserType({super.key});

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getPercentScreenHeight(8),
      width: getPercentScreenWidth(90),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffdcdee3), width: 1.5),
      ),
      padding: const EdgeInsets.all(10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(20),
          dropdownColor: Colors.white,
          isExpanded: true,
          value: selectedItem,
          // hint: Text("type".tr),
          onChanged: (value) {
            setState(() {
              selectedItem = value;
            });
          },
          items: <String>[
            'idividual'.tr,
            'institution'.tr,
          ].map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: greybasic,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
