import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
      enabledBorder: OutlineInputBorder(
          gapPadding: 10,
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kTextColor)),
      focusedBorder: OutlineInputBorder(
          gapPadding: 10,
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kTextColor)));
}
