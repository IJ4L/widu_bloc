import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/bloc/mapel_bloc/mapel_bloc.dart';
import 'package:widyaedu/bloc/next_bloc.dart';
import 'package:widyaedu/bloc/soal_bloc/soal_bloc.dart';
import 'package:widyaedu/shared/theme.dart';
import 'package:widyaedu/ui/util/replace_tag.dart';

import '../widgets/costume_shimmer.dart';

class PembahasanSoalPage extends StatelessWidget {
  const PembahasanSoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> item =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: SingleChildScrollView(
          child: BlocBuilder<ChangeBloc, int>(
            builder: (context, state) {
              final int to = state;
              return Column(
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
                            item['title'],
                            style: whiteTextStyle.copyWith(
                              fontSize: 20.sp,
                              fontWeight: bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              const Icon(Icons.arrow_back_ios_new_outlined),
                              Expanded(
                                child: Container(
                                  height: 45.r,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 7.w),
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.zero,
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
                                                color: kBlackColor
                                                    .withOpacity(0.2),
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
                          'Soal Nomor ${to + 1}',
                          style: blackTextStyle.copyWith(
                            fontSize: 12.sp,
                            fontWeight: bold,
                          ),
                          textScaleFactor: 1,
                        ),
                        SizedBox(height: 22.h),
                        BlocBuilder<SoalBloc, SoalState>(
                          builder: (context, state) {
                            if (state is SoalLoading) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ShimmerCostume(height: 12.sp, width: 80.w),
                                  SizedBox(height: 22.h),
                                  ShimmerCostume(height: 12.sp, width: 80.w),
                                  SizedBox(height: 22.h),
                                  ShimmerCostume(height: 30.sp, width: 140.w),
                                ],
                              );
                            }
                            if (state is LoadPembahasan) {
                              final data = state.allPembahasan[to];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  data.questionTitle != ''
                                      ? Text(
                                          replaceTags(data.questionTitle),
                                          style: blackTextStyle.copyWith(
                                              fontSize: 13),
                                          textScaleFactor: 1,
                                        )
                                      : Image.network(
                                          data.questionTitleImg,
                                          fit: BoxFit.fill,
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
                                    margin: EdgeInsets.only(
                                        top: 30.h, bottom: 39.h),
                                    decoration: BoxDecoration(
                                      color: kSecondColor,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: data.discussion == ''
                                        ? Image.network(
                                            data.discussionImg,
                                            fit: BoxFit.fill,
                                          )
                                        : Text(
                                            replaceTags(data.discussion),
                                            style: blackTextStyle.copyWith(
                                              fontSize: 11,
                                            ),
                                            textScaleFactor: 1,
                                          ),
                                  ),
                                ],
                              );
                            }
                            return Container();
                          },
                        ),
                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: BlocBuilder<ChangeBloc, int>(
            builder: (context, state) {
              final index = state;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  index == 0
                      ? const Text('')
                      : GestureDetector(
                          onTap: () =>
                              context.read<ChangeBloc>().add(PreviousEvent()),
                          child: Text(
                            'Kembali',
                            style: blackTextStyle.copyWith(
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                            textScaleFactor: 1,
                          ),
                        ),
                  BlocBuilder<SoalBloc, SoalState>(
                    builder: (context, state) {
                      if (state is LoadPembahasan) {
                        return GestureDetector(
                          onTap: () => index != 9
                              ? context.read<ChangeBloc>().add(NextEvent())
                              : {
                                  context
                                      .read<MapelBloc>()
                                      .add(LoadMapelEvent(item['email'])),
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/home',
                                    arguments: item['email'],
                                  ),
                                },
                          child: Text(
                            'Lanjut',
                            style: blackTextStyle.copyWith(
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                            textScaleFactor: 1,
                          ),
                        );
                      }
                      return const Text("");
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
