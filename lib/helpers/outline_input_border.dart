import 'package:flutter/material.dart';

OutlineInputBorder outlineInputBorder(MaterialColor backGroundColor) {
    return OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: backGroundColor,
            ),
          );
  }
