// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class Txt extends StatelessWidget {
  Txt({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.weight,
    this.maxLines,
    this.textOverFlow,
    this.textAlign,
    this.textDirection,
    this.decoration,
    this.fontStyle
  });

  String text;
  Color? color;
  double? size;
  FontWeight? weight;
  int? maxLines;
  TextOverflow? textOverFlow;
  TextAlign? textAlign;
  TextDirection? textDirection;
  TextDecoration? decoration;
  FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontStyle: fontStyle,
        decoration: decoration,
          color: color,
          fontSize: size,
          fontWeight: weight),
      maxLines: maxLines,
      overflow: textOverFlow,
      textAlign: textAlign,
      textDirection: textDirection,
    );
  }
}
