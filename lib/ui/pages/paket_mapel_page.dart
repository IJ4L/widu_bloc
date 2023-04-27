import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/bloc/paket_soal_bloc/paket_soal_bloc.dart';
import 'package:widyaedu/bloc/soal_bloc/soal_bloc.dart';

import '../../shared/theme.dart';
import '../widgets/card_soal_latihan.dart';
import '../widgets/costume_appbar.dart';
import '../widgets/navbar_widget.dart';

class PaketMapelPage extends StatelessWidget {
  const PaketMapelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Object? email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CostumeAppbar(title: 'Matematika', shadowText: false),
            BlocBuilder<PaketSoalBloc, PaketSoalState>(
              builder: (context, state) {
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
                      itemBuilder: (context, index) => CardPaketSoal(
                        title: data[index].exerciseTitle,
                        done: data[index].jumlahDone,
                        jumlahSoal: int.parse(data[index].jumlahSoal),
                        ontap: () {
                          context.read<SoalBloc>().add(
                                LoadSoalEvent(
                                  data[index].exerciseId,
                                  email.toString(),
                                ),
                              );
                          Navigator.pushNamed(context, '/soal');
                        },
                      ),
                    ),
                  );
                }
                if (state is PaketSoalLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
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
