import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/ui/util/validator_texfield.dart';

import '../../shared/theme.dart';

class CostumeTexfield extends StatelessWidget {
  const CostumeTexfield({
    super.key,
    required this.title,
    this.decoration = TextDecoration.none,
    required this.controller,
    this.validator = true,
  });

  final String title;
  final TextDecoration decoration;
  final TextEditingController controller;
  final bool validator;

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
              fontSize: 18,
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
            child: TextFormField(
              controller: controller,
              cursorColor: kBlackColor,
              style: blackTextStyle.copyWith(
                fontSize: 16.sp,
                decoration: decoration,
              ),
              validator: (value) => validator
                  ? Validator.required(value)
                  : Validator.email(value),
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
