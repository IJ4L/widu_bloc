import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/shared/theme.dart';

import '../widgets/card_info_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 45.h),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: kWhiteColor,
                  ),
                ),
                SizedBox(width: 70.w),
                Text(
                  'Akun Saya',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
          Center(
            child: Container(
              height: 149.r,
              width: 149.r,
              margin: EdgeInsets.only(bottom: 45.h),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(149.r / 2),
                boxShadow: [
                  BoxShadow(
                    color: kBlackColor.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
            ),
          ),
          const CardInfoProfile(
              title: 'Nama Lengkap', subtitle: 'Fitria Novitasari'),
          const CardInfoProfile(
              title: 'Email', subtitle: 'fitrianovitasari100@gmail.com'),
          const CardInfoProfile(title: 'Jenis Kelamin', subtitle: 'Perempuan'),
          const CardInfoProfile(title: 'Kelas', subtitle: 'VII-C'),
          const CardInfoProfile(
              title: 'Nama Sekolah', subtitle: 'SMPN 02 Bontang'),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              'Edit Akun',
              style: whiteTextStyle.copyWith(
                fontSize: 15,
                decoration: TextDecoration.underline,
                shadows: [defaultShadow],
              ),
            ),
          ),
          SizedBox(height: 19.h),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
            child: Center(
              child: Text(
                'Logout Akun',
                style: redkTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: bold,
                  decoration: TextDecoration.underline,
                  shadows: [defaultShadow],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
