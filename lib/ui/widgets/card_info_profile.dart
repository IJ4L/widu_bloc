import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/theme.dart';

class CardInfoProfile extends StatelessWidget {
  const CardInfoProfile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 64.w, right: 64.w, bottom: 19.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: whiteTextStyle.copyWith(fontSize: 14),
            textScaleFactor: 1,
          ),
          SizedBox(height: 6.h),
          Text(
            subtitle,
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
            textScaleFactor: 1,
          ),
        ],
      ),
    );
  }
}
