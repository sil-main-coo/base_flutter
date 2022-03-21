import 'package:flutter/material.dart';

class DropDownMenuModel {
  bool borderTop;
  bool borderBottom;
  bool isBoldText;

  Function() onPressed;
  String label;

  Color color;

  DropDownMenuModel(
      {this.borderTop = false,
      this.borderBottom = false,
      this.isBoldText = false,
      required this.onPressed,
      required this.label,
      required this.color});
}
