import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/bloc/next_bloc.dart';
import 'package:widyaedu/bloc/soal_bloc/soal_bloc.dart';
import 'package:widyaedu/shared/theme.dart';

class NilaiPage extends StatelessWidget {
  const NilaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List data = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Kamu Telah\nMenyelesaikan Soal',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              textAlign: TextAlign.center,
              textScaleFactor: 1,
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
                  return const Center(
                    child: CircularProgressIndicator(color: kWhiteColor),
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
                  context.read<SoalBloc>().add(LoadSoalEvent(data[1], data[0]));
                  Navigator.pushNamed(context, '/soal', arguments: data[0]);
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
                  Navigator.pushNamed(context, '/pembahasan-soal');
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
    );
  }
}
