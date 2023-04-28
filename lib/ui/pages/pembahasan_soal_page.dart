import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/shared/theme.dart';

class PembahasanSoalPage extends StatelessWidget {
  const PembahasanSoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 26.w),
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
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bahasa Indonesia',
                      style: whiteTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                      textScaleFactor: 1,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        const Icon(Icons.arrow_back_ios_new_outlined),
                        Expanded(
                          child: Container(
                            height: 45.r,
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  SizedBox(height: 4.h),
                                  Container(
                                    height: 36.r,
                                    width: 36.r,
                                    decoration: BoxDecoration(
                                      color: kWhiteColor,
                                      borderRadius:
                                          BorderRadius.circular(35.r / 2),
                                      boxShadow: [
                                        BoxShadow(
                                          color: kBlackColor.withOpacity(0.2),
                                          blurRadius: 4,
                                          offset: const Offset(0, 6),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${index + 1}",
                                        style: blackTextStyle.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              separatorBuilder: (_, index) =>
                                  const SizedBox(width: 10.0),
                              itemCount: 10,
                            ),
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios_sharp),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Soal Nomor 1',
                    style: blackTextStyle.copyWith(
                      fontSize: 12.sp,
                      fontWeight: bold,
                    ),
                    textScaleFactor: 1,
                  ),
                  SizedBox(height: 22.h),
                  Text(
                    'Menurut sejarah, kentang ditanam petani Peru sejak 2.000 tahun lalu pada 1524, saat tentara Spanyol mendarat di sana, kentang, kacang tanah, dan merica mulai dikenal dunia. Seorang tentara Spanyol tertarik pada kentang yang tumbuh subur di Desa Sorocota, di Pegunungan Andes, Peru. Ia membawanya ke Spanyol. Setelah mendarat di Spanyol, ia menyebarkannya ke seluruh penjuru Eropa.Pernyataan yang sesuai dengan isi teks tersebut adalah...',
                    style: blackTextStyle.copyWith(fontSize: 13),
                    textScaleFactor: 1,
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'Pembahasan:',
                    style: blackTextStyle.copyWith(
                      fontSize: 12.sp,
                      fontWeight: bold,
                    ),
                    textScaleFactor: 1,
                  ),
                  Container(
                    padding: EdgeInsets.all(24.w),
                    margin: EdgeInsets.only(top: 30.h, bottom: 39.h),
                    decoration: BoxDecoration(
                      color: kSecondColor,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text(
                      'Teks pada soal menjelaskan tentang sejarah persebaran tanaman kentang. Berdasarkan teks tersebut, kentang dibawa ke Eropa oleh tentara Spanyol dari Peru. Dari sana, kentang mulai menyebar ke seluruh Eropa. Jawaban: A',
                      style: blackTextStyle.copyWith(
                        fontSize: 11,
                      ),
                      textScaleFactor: 1,
                    ),
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Kembali',
              style: blackTextStyle.copyWith(
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
            Text(
              'Lanjut',
              style: blackTextStyle.copyWith(
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
