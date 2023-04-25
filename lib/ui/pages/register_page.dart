import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/bloc/gender_bloc.dart';
import 'package:widyaedu/shared/theme.dart';
import 'package:widyaedu/ui/widgets/costume_appbar.dart';
import 'package:widyaedu/ui/widgets/costume_button.dart';

import '../widgets/costume_textfield_with_title.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController namaLengkap = TextEditingController();
    final TextEditingController kelas = TextEditingController();
    final TextEditingController namaSekolah = TextEditingController();

    final GenderBloc genderBloc = context.read<GenderBloc>();
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CostumeAppbar(title: 'Registrasi'),
            CostumeTexfield(title: 'Email', controller: email),
            CostumeTexfield(title: 'Nama Lengkap', controller: namaLengkap),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 37.w),
              child: Text(
                'Jenis Kelamin',
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: regular),
                textScaleFactor: 1,
              ),
            ),
            const SizedBox(height: 8.0),
            BlocBuilder<GenderBloc, String>(
              builder: (context, state) {
                return Padding(
                  padding:
                      EdgeInsets.only(left: 37.w, right: 37.w, bottom: 25.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonGender(
                        genderBloc: genderBloc,
                        title: 'Laki-Laki',
                        genderEvent: SelectLakiLakiEvent(),
                      ),
                      ButtonGender(
                        genderBloc: genderBloc,
                        title: 'Perempuan',
                        genderEvent: SelectPerempuanEvent(),
                      ),
                    ],
                  ),
                );
              },
            ),
            CostumeTexfield(title: 'Kelas', controller: kelas),
            CostumeTexfield(title: 'Nama Sekolah', controller: namaSekolah),
            SizedBox(height: 10.h),
            Center(
              child: CostumeButton(
                title: 'Daftar',
                height: 45.h,
                width: 127.w,
                radius: 10,
                color: kSecondColor,
                colorTitle: kWhiteColor,
                blurRadius: 1,
                spreadRadius: 1,
                fontWeight: bold,
                ontap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonGender extends StatelessWidget {
  const ButtonGender({
    super.key,
    required this.genderBloc,
    required this.title,
    required this.genderEvent,
  });

  final String title;
  final GenderBloc genderBloc;
  final GenderEvent genderEvent;

  @override
  Widget build(BuildContext context) {
    return CostumeButton(
      title: title,
      height: 45.h,
      width: 132.w,
      radius: 10,
      color: genderBloc.state == title ? kSecondColor : kGreyColor,
      colorTitle: kBlackColor,
      blurRadius: 0,
      spreadRadius: 0,
      offset: const Offset(0, 5),
      opacity: 0.1,
      ontap: () => genderBloc.add(genderEvent),
    );
  }
}
