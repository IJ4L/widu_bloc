import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/shared/theme.dart';

class NilaiPage extends StatelessWidget {
  const NilaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Kamu Telah\nMenyelesaikan Soal',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 69.h),
            Image.asset(
              "assets/icon_done.png",
              width: 202,
              height: 238,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 48.h),
            Text('Nilai Kamu:', style: whiteTextStyle.copyWith(fontSize: 16)),
            Text('100', style: whiteTextStyle.copyWith(fontSize: 128)),
            Center(
              child: Text(
                'Kerjakan Ulang',
                style: redkTextStyle.copyWith(
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                  shadows: [defaultShadow],
                ),
              ),
            ),
            SizedBox(height: 19.h),
            Center(
              child: Text(
                'Lihat Pembahasan',
                style: whiteTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: bold,
                  decoration: TextDecoration.underline,
                  shadows: [defaultShadow],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
