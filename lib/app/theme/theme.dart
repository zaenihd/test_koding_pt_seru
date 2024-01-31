import 'package:flutter/material.dart';

FontWeight light = FontWeight.w300;
FontWeight normal = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

//GRADIENT
   const LinearGradient gradient1 = LinearGradient(colors: [
    Color(0xFF2B88D9),
    Color(0XFF26E0F5),
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);

   const LinearGradient gradient2 = LinearGradient(colors: [
    Color(0xFF2B88D9),
    Color(0XFF26E0F5),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  // COLOR

  var mainColor =Colors.amber;
  Color redColor = const Color(0xffE30000);
  Color greyColor = const Color(0xffA0A0A0);
  Color greyYoungColor = const Color(0xffEEEEEE);
  Color whiteColor =  Colors.white;
  Color blackColor =  Colors.black;
  Color greenColor =  const Color(0xff00FF00);
  Color yellowColor =  const Color(0xffFFB423);
  Color creamColor =  const Color(0xffFFEECC);

   BoxShadow shadow = BoxShadow(
    color: Colors.black.withOpacity(0.055),
    spreadRadius: 2,
    blurRadius: 7,
    offset: const Offset(3, 5),
  );