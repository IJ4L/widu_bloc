import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/theme.dart';
import '../widgets/costume_appbar.dart';

class PaketMapelPage extends StatelessWidget {
  const PaketMapelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CostumeAppbar(title: 'Matematika', shadowText: false),
            Container(
              height: 400.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: GridView.builder(
                itemCount: 5,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6.w,
                  crossAxisSpacing: 0.h,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) => CardPaketSoal(
                  ontap: () => Navigator.pushNamed(context, '/soal'),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 95.h,
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
    );
  }
}

class CardPaketSoal extends StatelessWidget {
  const CardPaketSoal({
    super.key,
    required this.ontap,
  });

  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 80.h,
        width: 150.w,
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
                Text(
                  'Trigonometri',
                  style: blackTextStyle.copyWith(
                    fontSize: 10.sp,
                    fontWeight: bold,
                  ),
                  textScaleFactor: 1,
                ),
                SizedBox(height: 6.h),
                Text(
                  '0/10 paket soal',
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
