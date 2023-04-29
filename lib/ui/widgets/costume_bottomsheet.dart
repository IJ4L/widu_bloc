import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/bloc/soal_bloc/soal_bloc.dart';

import '../../shared/theme.dart';
import 'costume_button.dart';

Future<dynamic> showDialogMaker(
  BuildContext context,
  String exerciseId,
  String email,
  String title,
) {
  return showModalBottomSheet(
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
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CostumeButton(
                  title: 'Nanti',
                  width: 138.w,
                  height: 37.h,
                  radius: 15.r,
                  opacity: 0.1,
                  ontap: () => Navigator.pop(context),
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
                  ontap: () {
                    context
                        .read<SoalBloc>()
                        .add(DoneTestEvent(exerciseId, email));
                    context.read<SoalBloc>().add(
                          LoadSkorEvent(
                            exerciseId,
                            email,
                          ),
                        );
                    Navigator.pushNamed(
                      context,
                      '/nilai',
                      arguments: {
                        'email': email,
                        'exerciseId': exerciseId,
                        'title': title
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
