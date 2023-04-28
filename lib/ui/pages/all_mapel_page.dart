import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/bloc/paket_soal_bloc/paket_soal_bloc.dart';
import 'package:widyaedu/shared/theme.dart';

import '../../bloc/mapel_bloc/mapel_bloc.dart';
import '../widgets/card_mapel.dart';
import '../widgets/costume_appbar.dart';

class AllMapelPage extends StatelessWidget {
  const AllMapelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Object? email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CostumeAppbar(title: 'Pilih Pelajaran', shadowText: false),
            BlocBuilder<MapelBloc, MapelState>(
              builder: (context, state) {
                if (state is MapelLoaded) {
                  final data = state.allMapel;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.66,
                    width: double.infinity,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => CardMapel(
                        //Ubah
                        icon: data[2].urlCover,
                        namaMapel: data[index].courseName,
                        done: data[index].jumlahDone,
                        jumlahPaket: data[index].jumlahMateri,
                        ontap: () {
                          context.read<PaketSoalBloc>().add(
                                LoadPaketEvent(
                                  data[index].courseId,
                                  email.toString(),
                                ),
                              );
                          Navigator.pushNamed(
                            context,
                            '/paket-mapel',
                            arguments: {
                              'email': email,
                              'courseName': data[index].courseName
                            },
                          );
                        },
                      ),
                      separatorBuilder: (_, index) => const SizedBox(height: 0),
                      itemCount: data.length,
                    ),
                  );
                }

                if (state is MapelLoading) {
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
      bottomNavigationBar: SizedBox(
        height: 95.h,
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70.h,
                width: double.infinity,
                color: kSecondColor,
              ),
            ),
            Positioned(
              bottom: 8.h,
              left: (MediaQuery.of(context).size.width - 66.h) / 2,
              child: Column(
                children: [
                  Container(
                    height: 66.h,
                    width: 66.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(66.h / 2),
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kBlackColor.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/icon_home.png",
                        width: 34.r,
                        height: 34.r,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'Home',
                    style: whiteTextStyle.copyWith(
                      fontSize: 15.sp,
                      fontWeight: bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
