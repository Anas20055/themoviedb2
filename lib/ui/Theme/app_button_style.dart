import 'package:flutter/material.dart';

abstract class AppBarStyle {
  static const ButtonStyle linkStyle = ButtonStyle(
    foregroundColor: MaterialStatePropertyAll(Color.fromRGBO(1, 180, 228, 1)),
    textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 16,fontWeight: FontWeight.w400))
  );
}