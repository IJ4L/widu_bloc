import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/bloc/next_bloc.dart';
import 'package:widyaedu/bloc/soal_bloc/soal_bloc.dart';
import 'package:widyaedu/shared/theme.dart';
import 'package:widyaedu/ui/widgets/costume_shimmer.dart';

import '../../bloc/choice_bloc.dart';
import '../util/replace_tag.dart';
import '../widgets/card_choice.dart';
import '../widgets/costume_bottomsheet.dart';

class SoalPage extends StatelessWidget {
  const SoalPage({super.key});

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
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),
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
                                      EdgeInsets.symmetric(horizontal: 3.w),
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
                                                color: to == index
                                                    ? kSecondColor
                                                    : kBlackColor,
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
                  BlocBuilder<SoalBloc, SoalState>(
                    builder: (context, state) {
                      if (state is SoalLoading) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerCostume(height: 12.sp, width: 80.w),
                            SizedBox(height: 22.h),
                            ShimmerCostume(height: 13.sp, width: 140.w),
                            SizedBox(height: 6.h),
                            ShimmerCostume(height: 13.sp, width: 200.w),
                            SizedBox(height: 6.h),
                            ShimmerCostume(height: 13.sp, width: 200.w),
                            SizedBox(height: 6.h),
                            ShimmerCostume(height: 13.sp, width: 180.w),
                            SizedBox(height: 26.h),
                            ShimmerCostume(height: 30.h),
                            SizedBox(height: 16.h),
                            ShimmerCostume(height: 30.h),
                            SizedBox(height: 16.h),
                            ShimmerCostume(height: 30.h),
                            SizedBox(height: 16.h),
                            ShimmerCostume(height: 30.h),
                            SizedBox(height: 16.h),
                            ShimmerCostume(height: 30.h),
                          ],
                        );
                      }
                      if (state is SoalLoaded) {
                        if (state.allSoal.isNotEmpty) {
                          final data = state.allSoal[to];
                          return Padding(
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
                                data.questionTitle != ''
                                    ? Text(
                                        replaceTags(data.questionTitle),
                                        style: blackTextStyle.copyWith(
                                          fontSize: 13.sp,
                                        ),
                                      )
                                    : Image.network(
                                        data.questionTitleImg,
                                      ),
                                BlocBuilder<ChoiceBloc, String>(
                                  builder: (context, state) {
                                    return Column(
                                      children: [
                                        ChoiceCard(
                                          alphabet: 'A.',
                                          answer: data.optionA,
                                          imgAnswer: data.optionAImg,
                                          color: state == 'A',
                                          event: SelectA(),
                                        ),
                                        ChoiceCard(
                                          alphabet: 'B.',
                                          answer: data.optionB,
                                          imgAnswer: data.optionBImg,
                                          color: state == 'B',
                                          event: SelectB(),
                                        ),
                                        ChoiceCard(
                                          alphabet: 'C.',
                                          answer: data.optionC,
                                          imgAnswer: data.optionCImg,
                                          color: state == 'C',
                                          event: SelectC(),
                                        ),
                                        ChoiceCard(
                                          alphabet: 'D.',
                                          answer: data.optionD,
                                          imgAnswer: data.optionDImg,
                                          color: state == 'D',
                                          event: SelectD(),
                                        ),
                                        ChoiceCard(
                                          alphabet: 'E.',
                                          answer: data.optionE,
                                          imgAnswer: data.optionEImg,
                                          color: state == 'E',
                                          event: SelectE(),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(height: 32.h),
                              ],
                            ),
                          );
                        }
                      }
                      return const Center(
                        child: Text('Empty!'),
                      );
                    },
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
                          onTap: () => context.read<ChangeBloc>().add(
                                PreviousEvent(),
                              ),
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
                      if (state is SoalLoaded) {
                        if (state.allSoal.isNotEmpty) {
                          final data = state.allSoal[index];
                          return GestureDetector(
                            onTap: () {
                              context.read<SoalBloc>().add(
                                    AnswerSoalEvent(
                                      data.exerciseIdFk,
                                      item['email'],
                                      data.bankQuestionId,
                                      context.read<ChoiceBloc>().state,
                                    ),
                                  );
                              context.read<ChoiceBloc>().add(Initial());
                              index == 9
                                  ? showDialogMaker(
                                      context,
                                      data.exerciseIdFk,
                                      item['email'],
                                      item['title'],
                                    )
                                  : context.read<ChangeBloc>().add(NextEvent());
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
                      }
                      return GestureDetector(
                        onTap: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home',
                          (route) => false,
                          arguments: item['email'],
                        ),
                        child: Text(
                          'Kembali Ke home',
                          style: blackTextStyle.copyWith(
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          ),
                          textScaleFactor: 1,
                        ),
                      );
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
