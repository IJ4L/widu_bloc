import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widyaedu/bloc/next_bloc.dart';
import 'package:widyaedu/bloc/paket_soal_bloc/paket_soal_bloc.dart';
import 'package:widyaedu/bloc/soal_bloc/soal_bloc.dart';

import '../../bloc/choice_bloc.dart';
import '../../shared/theme.dart';
import '../widgets/card_soal_latihan.dart';
import '../widgets/costume_appbar.dart';
import '../widgets/navbar_widget.dart';

class PaketMapelPage extends StatelessWidget {
  const PaketMapelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> item =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CostumeAppbar(title: item['courseName'], shadowText: false),
            BlocBuilder<PaketSoalBloc, PaketSoalState>(
              builder: (context, state) {
                if (state is PaketSoalLoading) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ShimmerSmall(),
                      SizedBox(width: 20.h),
                      const ShimmerSmall(),
                    ],
                  );
                }
                if (state is PaketSoalLoaded) {
                  final data = state.allPaketMapel;
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.66,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: GridView.builder(
                      itemCount: data.length,
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 6.w,
                        crossAxisSpacing: 0.h,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) {
                        final file = data[index];
                        return CardPaketSoal(
                          title: file.exerciseTitle,
                          done: file.jumlahDone,
                          jumlahSoal: int.parse(data[index].jumlahSoal),
                          ontap: () {
                            context.read<ChangeBloc>().add(InitalChange());
                            context.read<ChoiceBloc>().add(Initial());
                            context.read<SoalBloc>().add(
                                  LoadSoalEvent(
                                    file.exerciseId,
                                    item['email'],
                                  ),
                                );
                            Navigator.pushNamed(
                              context,
                              '/soal',
                              arguments: {
                                'email': item['email'],
                                'title': file.exerciseTitle
                              },
                            );
                          },
                        );
                      },
                    ),
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}

class ShimmerSmall extends StatelessWidget {
  const ShimmerSmall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: 200,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(defaulRadius),
          ),
        ),
      ),
    );
  }
}
