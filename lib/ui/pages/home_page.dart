import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/bloc/auth_bloc/auth_bloc.dart';
import 'package:widyaedu/bloc/mapel_bloc/mapel_bloc.dart';
import 'package:widyaedu/shared/theme.dart';
import 'package:widyaedu/ui/widgets/navbar_widget.dart';

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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                if (state is Authenticated) {
                                  return Text(
                                    'Hai, ${state.userData.userName}',
                                    style: whiteTextStyle.copyWith(
                                      fontWeight: bold,
                                      fontSize: 14.sp,
                                    ),
                                  );
                                }
                                return const Text('');
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/profile'),
                            child: BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                if (state is Authenticated) {
                                  return Container(
                                    height: 34.r,
                                    width: 34.r,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(29),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          state.userData.userFoto,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: kBlackColor.withOpacity(0.2),
                                          blurRadius: 4,
                                          offset: const Offset(0, 6),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                return Container();
                              },
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
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is Authenticated) {
                        final data = state.userData;
                        return GestureDetector(
                          onTap: () async {
                            Navigator.pushNamed(context, '/all-mapel',
                                arguments: data.userEmail);
                            context
                                .read<MapelBloc>()
                                .add(LoadMapelEvent(data.userEmail));
                          },
                          child: Text(
                            'Lihat Semua',
                            style: blackTextStyle.copyWith(
                              fontSize: 16.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            // CardMapel(
            //   icon: "assets/icon_mtk.png",
            //   namaMapel: 'Matematika',
            //   ontap: () => Navigator.pushNamed(
            //     context,
            //     '/paket-mapel',
            //   ),
            // ),
            // CardMapel(
            //   icon: "assets/icon_bio.png",
            //   namaMapel: 'Biologi',
            //   ontap: () {},
            // ),
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
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
