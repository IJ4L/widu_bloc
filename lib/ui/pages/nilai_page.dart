import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/bloc/mapel_bloc/mapel_bloc.dart';
import 'package:widyaedu/bloc/next_bloc.dart';
import 'package:widyaedu/bloc/soal_bloc/soal_bloc.dart';
import 'package:widyaedu/shared/theme.dart';

class NilaiPage extends StatelessWidget {
  const NilaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      context
                          .read<MapelBloc>()
                          .add(LoadMapelEvent(data['email']));
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        arguments: data['email'],
                        (route) => false,
                      );
                    },
                    child: const Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  Text(
                    'Selamat Kamu Telah\nMenyelesaikan Soal',
                    style:
                        whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
                    textAlign: TextAlign.center,
                    textScaleFactor: 1,
                  ),
                  const SizedBox(),
                  const SizedBox()
                ],
              ),
              SizedBox(height: 69.h),
              Image.asset(
                "assets/icon_done.png",
                width: 202.r,
                height: 238.r,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 48.h),
              Text(
                'Nilai Kamu:',
                style: whiteTextStyle.copyWith(fontSize: 16),
                textScaleFactor: 1,
              ),
              BlocBuilder<SoalBloc, SoalState>(
                builder: (context, state) {
                  if (state is SoalLoading) {
                    return SizedBox(
                      height: 128.h,
                      child: const Center(
                        child: CircularProgressIndicator(color: kWhiteColor),
                      ),
                    );
                  }

                  if (state is SoalGetSkor) {
                    return Text(
                      state.skor.jumlahScore,
                      style: whiteTextStyle.copyWith(fontSize: 128),
                      textScaleFactor: 1,
                    );
                  }

                  return Container();
                },
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    context.read<ChangeBloc>().add(InitalChange());
                    context.read<SoalBloc>().add(
                          LoadSoalEvent(
                            data['exerciseId'],
                            data['email'],
                          ),
                        );
                    Navigator.pushNamed(
                      context,
                      '/soal',
                      arguments: {
                        'exerciseId': data['exerciseId'],
                        'email': data['email'],
                        'title': data['title'],
                      },
                    );
                  },
                  child: Text(
                    'Kerjakan Ulang',
                    style: redkTextStyle.copyWith(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      shadows: [defaultShadow],
                    ),
                    textScaleFactor: 1,
                  ),
                ),
              ),
              SizedBox(height: 19.h),
              Center(
                child: GestureDetector(
                  onTap: () {
                    context.read<ChangeBloc>().add(InitalChange());
                    context.read<SoalBloc>().add(
                          LoadPembahasanEvent(
                            data['exerciseId'],
                            data['email'],
                          ),
                        );
                    Navigator.pushNamed(
                      context,
                      '/pembahasan-soal',
                      arguments: {
                        'title': data['title'],
                        'email': data['email'],
                      },
                    );
                  },
                  child: Text(
                    'Lihat Pembahasan',
                    style: whiteTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: bold,
                      decoration: TextDecoration.underline,
                      shadows: [defaultShadow],
                    ),
                    textScaleFactor: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
