import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:wasil_user/utils/size_config.dart';

import '../../../../utils/app_style.dart';

class CodeCountry extends StatefulWidget {
  const CodeCountry({super.key});

  @override
  State<CodeCountry> createState() => _CodeCountryState();
}

class _CodeCountryState extends State<CodeCountry> {
  String countryCode = "962";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0.1,
            backgroundColor: whiteColor,
            textStyle: const TextStyle(color: primaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
            )),
        onPressed: () {
          showCountryPicker(
            context: context,
            //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
            exclude: <String>['KN', 'MF'],
            favorite: <String>['Jo'],
            //Optional. Shows phone code before the country name.
            showPhoneCode: true,
            onSelect: (Country country) {
              setState(() {
                countryCode = country.phoneCode;
              });
            },
            // Optional. Sets the theme for the country list picker.
            countryListTheme: CountryListThemeData(
              bottomSheetHeight: getPercentScreenHeight(50),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
              // Optional. Styles the search field.
              flagSize: 25,

              inputDecoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Start typing to search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFF8C98A8).withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(25)),
              ),
              // Optional. Styles the text in the search field
              searchTextStyle: const TextStyle(
                color: Colors.green,
                fontSize: 10,
              ),
            ),
          );
        },
        child: Text(countryCode, style: const TextStyle(color: primaryColor)),
      ),
    );
  }
}
