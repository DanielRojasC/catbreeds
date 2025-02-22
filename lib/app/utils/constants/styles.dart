import 'package:flutter/material.dart';

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

final class Styles {
  static Color primaryColor = Color(0xffFAFAFA);
  static Color secondaryColor = Color.fromARGB(255, 190, 231, 250);

  static TextStyle basicTextStyle(
    double fontSize, {
    FontWeight fontWeight = FontWeight.bold,
  }) =>
      TextStyle(
        color: Colors.black,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );

  static InputDecoration searchInputDecoration(String hintText) =>
      InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        suffixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
      );
}
