import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff6778d3);
const Color kSecondColor = Color(0xff9997ff);
const Color kWhiteColor = Color(0xffFFFFFF);
const Color kGreyColor = Color(0xffE2E2E2);
const Color kBlackColor = Color(0xff000000);
const Color kRedColor = Color(0xffF35C5C);

TextStyle blackTextStyle = const TextStyle(color: kBlackColor);
TextStyle purpleTextStyle = const TextStyle(color: kPrimaryColor);
TextStyle whiteTextStyle = const TextStyle(color: kWhiteColor);
TextStyle redkTextStyle = const TextStyle(color: kRedColor);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.bold;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

double defaulRadius = 10.0;

Shadow defaultShadow = Shadow(
  offset: const Offset(0, 5),
  blurRadius: 15.0,
  color: kBlackColor.withOpacity(0.3),
);
