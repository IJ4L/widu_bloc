import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/theme.dart';

class CostumeAppbar extends StatelessWidget {
  const CostumeAppbar({
    super.key,
    required this.title,
    this.shadowText = true,
  });

  final String title;
  final bool shadowText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: double.infinity,
      padding: EdgeInsets.only(left: 30.w, top: 30.h),
      margin: EdgeInsets.only(bottom: 25.h),
      decoration: BoxDecoration(
        color: kSecondColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.3),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: kWhiteColor,
              weight: 24.h,
            ),
          ),
          SizedBox(width: 22.w),
          Text(
            title,
            style: whiteTextStyle.copyWith(
              fontSize: 22,
              fontWeight: bold,
              shadows: [shadowText ? defaultShadow : const Shadow()],
            ),
            textScaleFactor: 1,
          )
        ],
      ),
    );
  }
}
