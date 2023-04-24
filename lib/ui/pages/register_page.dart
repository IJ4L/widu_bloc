import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/shared/theme.dart';
import 'package:widyaedu/ui/widgets/costume_appbar.dart';
import 'package:widyaedu/ui/widgets/costume_button.dart';

import '../widgets/costume_textfield_with_title.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CostumeAppbar(title: 'Registrasi'),
            const CostumeTexfield(title: 'Email'),
            const CostumeTexfield(title: 'Nama Lengkap'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 37.w),
              child: Text(
                'Jenis Kelamin',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: regular,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.only(left: 37.w, right: 37.w, bottom: 25.h),
              child: Row(
                children: [
                  CostumeButton(
                    title: 'Laki-Laki',
                    height: 52,
                    width: 152,
                    radius: 10,
                    color: kGreyColor,
                    colorTitle: kBlackColor,
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: const Offset(0, 5),
                    opacity: 0.1,
                    ontap: () {},
                  ),
                  const Spacer(),
                  CostumeButton(
                    title: 'Perempuan',
                    height: 52,
                    width: 152,
                    radius: 10,
                    color: kGreyColor,
                    colorTitle: kBlackColor,
                    blurRadius: 1,
                    spreadRadius: 0,
                    offset: const Offset(0, 5),
                    opacity: 0.1,
                    ontap: () {},
                  ),
                ],
              ),
            ),
            const CostumeTexfield(title: 'Kelas'),
            const CostumeTexfield(title: 'Nama Sekolah'),
            Center(
              child: CostumeButton(
                title: 'Daftar',
                height: 45,
                width: 127,
                radius: 10,
                color: kSecondColor,
                colorTitle: kWhiteColor,
                blurRadius: 1,
                spreadRadius: 1,
                ontap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
