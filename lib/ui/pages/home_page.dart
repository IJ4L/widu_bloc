import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/shared/theme.dart';

import '../widgets/card_mapel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190.h,
              width: double.infinity,
              padding: EdgeInsets.only(top: 20.h),
              margin: EdgeInsets.only(bottom: 25.h),
              decoration: BoxDecoration(
                color: kSecondColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kBlackColor.withOpacity(0.4),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icon_welcome.png",
                    width: 128.r,
                    height: 128.r,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hai, Fitria Novitasari',
                            style: whiteTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(width: 18.w),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/profile'),
                            child: Container(
                              height: 34.r,
                              width: 34.r,
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.circular(29),
                                boxShadow: [
                                  BoxShadow(
                                    color: kBlackColor.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 22.h),
                      Text(
                        'Yuk Latihan Soal Lagi\nPelajaran apa hari ini ?',
                        style: whiteTextStyle.copyWith(fontSize: 14.sp),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pilihan Pelajaran',
                    style: blackTextStyle.copyWith(
                      fontSize: 20.sp,
                      fontWeight: bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/all-mapel'),
                    child: Text(
                      'Lihat Semua',
                      style: blackTextStyle.copyWith(
                        fontSize: 16.sp,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            CardMapel(
              icon: "assets/icon_mtk.png",
              namaMapel: 'Matematika',
              ontap: () => Navigator.pushNamed(
                context,
                '/paket-mapel',
              ),
            ),
            CardMapel(
              icon: "assets/icon_bio.png",
              namaMapel: 'Biologi',
              ontap: () {},
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              child: Text(
                'Terbaru',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                ),
                textScaleFactor: 1,
              ),
            ),
            SizedBox(
              height: 146.h,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  height: 146.h,
                  width: 284.w,
                  margin: EdgeInsets.only(left: 30.w),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                separatorBuilder: (_, index) => const SizedBox(width: 10.0),
                itemCount: 3,
              ),
            ),
            SizedBox(
              height: 120.h,
              width: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70.h,
                      width: double.infinity,
                      color: kSecondColor,
                    ),
                  ),
                  Positioned(
                    bottom: 8.h,
                    left: (MediaQuery.of(context).size.width - 66.h) / 2,
                    child: Column(
                      children: [
                        Container(
                          height: 66.h,
                          width: 66.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(66.h / 2),
                            border: Border.all(
                              color: kPrimaryColor,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kBlackColor.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/icon_home.png",
                              width: 34.r,
                              height: 34.r,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          'Home',
                          style: whiteTextStyle.copyWith(
                            fontSize: 15.sp,
                            fontWeight: bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
