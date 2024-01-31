import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tes_koding_pt_seru_zaeni_hilman_darmawan/app/widget/text/txt.dart';

// ignore: must_be_immutable
class ButtonCostum extends StatelessWidget {
  ButtonCostum(
      {Key? key,
      required this.title,
      this.navigation = true,
      required this.onPressed,
      this.margin,
      required this.color})
      : super(key: key);

  String title;
  Function() onPressed;
  bool navigation;
  Color color;
  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ??
          const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
      height: 45,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: Txt(
            text: title,
            weight: FontWeight.bold,
            color: Colors.white,
          )),
    );
  }
}
