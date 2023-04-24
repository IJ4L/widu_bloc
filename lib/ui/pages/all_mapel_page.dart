import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/shared/theme.dart';

import '../widgets/card_mapel.dart';
import '../widgets/costume_appbar.dart';

class AllMapelPage extends StatelessWidget {
  const AllMapelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CostumeAppbar(title: 'Pilih Pelajaran', shadowText: false),
            CardMapel(
              icon: 'assets/icon_bio.png',
              namaMapel: 'Biologi',
              ontap: () {},
            ),
            CardMapel(
              icon: 'assets/icon_bio.png',
              namaMapel: 'Biologi',
              ontap: () {},
            ),
            CardMapel(
              icon: 'assets/icon_bio.png',
              namaMapel: 'Biologi',
              ontap: () {},
            ),
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
