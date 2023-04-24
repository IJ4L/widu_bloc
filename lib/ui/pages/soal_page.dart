import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/shared/theme.dart';
import 'package:widyaedu/ui/widgets/costume_button.dart';

class SoalPage extends StatelessWidget {
  const SoalPage({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                  children: [
                    const SizedBox(height: 16.0),
                    Text(
                      'Bahasa Indonesia',
                      style: whiteTextStyle.copyWith(
                        fontSize: 20.sp,
                        fontWeight: bold,
                      ),
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
                    style: blackTextStyle.copyWith(fontSize: 13.sp),
                  ),
                  const ChoiceCard(
                    alphabet: 'A.',
                    answer: 'Penyebar kentang di Eropa adalah Spanyol',
                  ),
                  const ChoiceCard(
                    alphabet: 'B.',
                    answer: 'Kentang merupakan makanan pokok tentara Spanyol',
                  ),
                  const ChoiceCard(
                    alphabet: 'C.',
                    answer:
                        'Penemuan kacang tanah dan kentang dilakukan dengan sengaja',
                  ),
                  const ChoiceCard(
                    alphabet: 'D.',
                    answer:
                        'Ketertarikan tentara Spanyol karena kentang karena ditanam di Peru',
                  ),
                  const ChoiceCard(
                    alphabet: 'E.',
                    answer: 'Semua jawaban benar',
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kembali',
                        style: blackTextStyle.copyWith(
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15.r),
                            ),
                          ),
                          builder: (context) => Container(
                            height: 350.h,
                            decoration: BoxDecoration(
                              color: kSecondColor,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15.r),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 6.h,
                                  width: 132.w,
                                  margin: EdgeInsets.only(top: 16.h),
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        color: kBlackColor.withOpacity(0.2),
                                        blurRadius: 4,
                                        offset: const Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40.h),
                                Text(
                                  'Kumpulin Latihan Soal Sekarang ?',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: bold,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Image.asset(
                                  "assets/icon_send.png",
                                  width: 152.w,
                                  height: 145.h,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(height: 22.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CostumeButton(
                                        title: 'Nanti',
                                        width: 138.w,
                                        height: 37.h,
                                        radius: 15.r,
                                        opacity: 0.1,
                                        ontap: () {},
                                      ),
                                      CostumeButton(
                                        title: 'Kirim',
                                        width: 138.w,
                                        height: 37.h,
                                        radius: 15.r,
                                        opacity: 0.1,
                                        color: kSecondColor,
                                        colorTitle: kWhiteColor,
                                        widthBorder: 1.5,
                                        ontap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        child: Text(
                          'Lanjut',
                          style: blackTextStyle.copyWith(
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({
    super.key,
    required this.alphabet,
    required this.answer,
  });

  final String alphabet, answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          width: 1.0,
          color: Colors.grey[900]!,
        ),
      ),
      child: Row(
        children: [
          Text(
            alphabet,
            style: blackTextStyle.copyWith(fontSize: 11.sp),
          ),
          SizedBox(width: 18.w),
          Expanded(
            child: Text(
              answer,
              style: blackTextStyle.copyWith(fontSize: 11.sp),
            ),
          ),
        ],
      ),
    );
  }
}
