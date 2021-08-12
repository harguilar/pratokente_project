import 'package:flutter/material.dart';

// Box Decorations

BoxDecoration fieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[200]);

// colors
const Color kcPrimaryColor = Color(0xff22A45D);

BoxDecoration disabledFieldDecortaion = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[100]);

// Field Variables

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = const EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    const EdgeInsets.symmetric(horizontal: 15, vertical: 15);

// Text Variables
const TextStyle buttonTitleTextStyle =
    const TextStyle(fontWeight: FontWeight.w700, color: Colors.white);
// TextStyle
const TextStyle ktsMediumGreyBodyText =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 17.0);

const TextStyle kcMediumBody = TextStyle(
    fontFamily: "Sofia",
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: Colors.orange);

const TextStyle ktMediumBody = TextStyle(
    fontFamily: "Sofia",
    fontWeight: FontWeight.w500,
    fontSize: 18.0,
    color: Colors.orange);
const TextStyle kcValidationMessage = TextStyle(
  color: Colors.red,
  fontSize: 15.0,
);

const TextStyle kcProductNameBody = TextStyle(
    fontFamily: "Sofia",
    fontWeight: FontWeight.w600,
    fontSize: 17.0,
    color: Colors.black87);
// TextStyle

const TextStyle kcBottomNav =
    TextStyle(fontFamily: "Sofia", letterSpacing: 0.5);

const TextStyle kcLocation = TextStyle(
    fontFamily: "Sofia",
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
    color: Colors.black26);

const TextStyle kcAppBar =
    TextStyle(fontFamily: "Sofia", fontSize: 19.0, fontWeight: FontWeight.w700);

// Font Sizing
const double kBodyTextSize = 16;
