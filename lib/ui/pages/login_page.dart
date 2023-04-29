import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/bloc/auth_bloc/auth_bloc.dart';
import 'package:widyaedu/bloc/banner_bloc/banner_bloc.dart';
import 'package:widyaedu/bloc/mapel_bloc/mapel_bloc.dart';
import 'package:widyaedu/shared/theme.dart';

import '../widgets/costume_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 50.h),
            padding: EdgeInsets.only(left: 35.w),
            child: Image.asset(
              "assets/icon_login.png",
              height: 207.h,
              width: 201.w,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50.h),
            child: Text(
              'Latihan Soal Bersama\nWidya Edu',
              style: whiteTextStyle.copyWith(
                fontSize: 24.sp,
                fontWeight: bold,
                shadows: [defaultShadow],
              ),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
            ),
          ),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is Authenticated) {
                final data = state.userData;
                context.read<MapelBloc>().add(LoadMapelEvent(data.userEmail));
                context.read<BannerBloc>().add(LoadBannerEvent());
                Navigator.pushReplacementNamed(
                  context,
                  '/home',
                  arguments: data.userEmail,
                );
              }

              if (state is Unauthenticated) {
                Navigator.pushNamed(context, '/register', arguments: {
                  'edit': 'false',
                  'redirect': 'true',
                  'email': state.message,
                });
              }
            },
            builder: (context, state) {
              return CostumeButton(
                title: 'Login With Google',
                fontWeight: bold,
                ontap: () => context.read<AuthBloc>().add(LoggedInEvent()),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1.h,
                    color: kWhiteColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    'OR',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: bold,
                    ),
                    textScaleFactor: 1,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1.h,
                    color: kWhiteColor,
                  ),
                )
              ],
            ),
          ),
          CostumeButton(
            title: 'Registrasi',
            color: kSecondColor,
            colorTitle: kWhiteColor,
            fontWeight: bold,
            ontap: () => Navigator.pushNamed(
              context,
              '/register',
              arguments: {
                'edit': 'false',
                'redirect': 'false',
              },
            ),
          ),
        ],
      ),
    );
  }
}
