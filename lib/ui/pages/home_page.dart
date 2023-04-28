import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/bloc/auth_bloc/auth_bloc.dart';
import 'package:widyaedu/bloc/banner_bloc/banner_bloc.dart';
import 'package:widyaedu/bloc/mapel_bloc/mapel_bloc.dart';
import 'package:widyaedu/shared/theme.dart';
import 'package:widyaedu/ui/widgets/navbar_widget.dart';

import '../../bloc/paket_soal_bloc/paket_soal_bloc.dart';
import '../widgets/card_mapel.dart';
import '../widgets/costume_shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
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
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                    textScaleFactor: 1,
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is Authenticated) {
                        final data = state.userData;
                        return GestureDetector(
                          onTap: () async {
                            Navigator.pushNamed(
                              context,
                              '/all-mapel',
                              arguments: {'email': data.userEmail},
                            );
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
            SizedBox(height: 16.h),
            BlocBuilder<MapelBloc, MapelState>(
              builder: (context, state) {
                if (state is MapelLoading) {
                  return Column(
                    children: [
                      const ShimmerCostume(height: 90),
                      SizedBox(height: 20.h),
                      const ShimmerCostume(height: 90),
                    ],
                  );
                }
                if (state is MapelLoaded) {
                  final allData = state.allMapel;
                  return SizedBox(
                    height: 220.h,
                    width: double.infinity,
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = allData[index];
                        if (data.courseId == '136' || data.courseId == '148') {
                          return CardMapel(
                            icon: data.urlCover,
                            namaMapel: data.courseName,
                            done: data.jumlahDone,
                            jumlahPaket: data.jumlahMateri,
                            ontap: () {
                              context.read<PaketSoalBloc>().add(
                                    LoadPaketEvent(
                                      data.courseId,
                                      email,
                                    ),
                                  );
                              Navigator.pushNamed(
                                context,
                                '/paket-mapel',
                                arguments: {
                                  'email': email,
                                  'courseName': data.courseName
                                },
                              );
                            },
                          );
                        }
                        return Container();
                      },
                      separatorBuilder: (_, index) => const SizedBox(height: 0),
                      itemCount: allData.length,
                    ),
                  );
                }
                return Container();
              },
            ),
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
            BlocBuilder<BannerBloc, BannerState>(
              builder: (context, state) {
                if (state is BannerLoading) {
                  return const ShimmerCostume(height: 146);
                }
                if (state is BannerLoaded) {
                  return SizedBox(
                    height: 146.h,
                    width: double.infinity,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final data = state.allBanner[index];
                        return Container(
                          height: 146.h,
                          width: 284.w,
                          margin: EdgeInsets.only(left: 30.w),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(data.eventImage),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) =>
                          const SizedBox(width: 10.0),
                      itemCount: state.allBanner.length,
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
