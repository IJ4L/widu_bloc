import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/theme.dart';

class CostumeTexfield extends StatelessWidget {
  const CostumeTexfield({
    super.key,
    required this.title,
    this.decoration = TextDecoration.none,
    required this.controller,
  });

  final String title;
  final TextDecoration decoration;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 37.w, right: 37.w, bottom: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: regular,
            ),
            textScaleFactor: 1,
          ),
          const SizedBox(height: 8.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(defaulRadius),
              ),
              boxShadow: [
                BoxShadow(
                  color: kBlackColor.withOpacity(0.2),
                  blurRadius: 1,
                  spreadRadius: 0,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              cursorColor: kBlackColor,
              style: blackTextStyle.copyWith(
                fontSize: 12.sp,
                decoration: decoration,
              ),
              decoration: InputDecoration(
                fillColor: kGreyColor,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 26.w,
                  vertical: 12.w,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(defaulRadius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(defaulRadius),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
