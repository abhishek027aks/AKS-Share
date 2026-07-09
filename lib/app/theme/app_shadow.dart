import 'package:flutter/material.dart';

class AppShadow {
  AppShadow._();

  static List<BoxShadow> card = [
    BoxShadow(
      color: Colors.black.withOpacity(.20),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ];
}