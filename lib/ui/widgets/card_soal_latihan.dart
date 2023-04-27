import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/theme.dart';

class CardPaketSoal extends StatelessWidget {
  const CardPaketSoal({
    super.key,
    required this.ontap,
    required this.title,
    required this.done,
    required this.jumlahSoal,
  });

  final String title;
  final int done, jumlahSoal;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
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
            Image.asset(
              "assets/icon_paket.png",
              width: 40.r,
              height: 40.r,
              fit: BoxFit.fill,
            ),
            SizedBox(width: 14.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 70.w,
                  child: Text(
                    title,
                    style: blackTextStyle.copyWith(
                      fontSize: 10.sp,
                      fontWeight: bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                    textScaleFactor: 1,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  '$done/$jumlahSoal soal latihan',
                  style: blackTextStyle.copyWith(
                    fontSize: 8.sp,
                    fontWeight: regular,
                  ),
                  textScaleFactor: 1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
