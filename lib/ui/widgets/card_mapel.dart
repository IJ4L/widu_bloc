import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../shared/theme.dart';

class CardMapel extends StatelessWidget {
  const CardMapel({
    super.key,
    required this.icon,
    required this.namaMapel,
    required this.ontap,
    required this.done,
    required this.jumlahPaket,
  });

  final String icon, namaMapel;
  final int done, jumlahPaket;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 90.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        decoration: BoxDecoration(
          color: const Color(0xffe9e9e9),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.2),
              blurRadius: 1,
              spreadRadius: 0,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.network(
              icon,
              width: 60.r,
              height: 60.r,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 21.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namaMapel,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                  textScaleFactor: 1,
                ),
                SizedBox(height: 14.h),
                Text(
                  '$done/$jumlahPaket paket soal',
                  style: blackTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: regular,
                  ),
                  textScaleFactor: 1,
                ),
                SizedBox(height: 8.h),
                LinearPercentIndicator(
                  width: 150.w,
                  lineHeight: 4.h,
                  percent: done / jumlahPaket,
                  backgroundColor: Colors.grey,
                  progressColor: kPrimaryColor,
                  barRadius: const Radius.circular(10),
                  padding: EdgeInsets.zero,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
