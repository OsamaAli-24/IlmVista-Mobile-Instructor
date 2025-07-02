import 'package:flutter/material.dart';
import 'package:get/get.dart';

const poppinsLight = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w300,
);

const poppinsRegular = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
);

const poppinsMedium = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);

const poppinsBold = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w700,
);

const poppinsSemiBold = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);

List<BoxShadow>? searchBoxShadow = Get.isDarkMode ? null : [const BoxShadow(
    offset: Offset(0,3),
    color: Color(0x208F94FB), blurRadius: 5, spreadRadius: 2)];

//card boxShadow
List<BoxShadow>? cardShadow = Get.isDarkMode? null:[BoxShadow(
  offset: const Offset(0, 1),
  blurRadius: 2,
  color: Colors.black.withOpacity(0.15),
)];


List<BoxShadow>? shadow = Get.isDarkMode ? [BoxShadow(
    offset: const Offset(0,3),
    color: Colors.grey[100]!, blurRadius: 1, spreadRadius: 2)] : [BoxShadow(
    offset: const Offset(0,3),
    color: Colors.grey[100]!, blurRadius: 1, spreadRadius: 2)];