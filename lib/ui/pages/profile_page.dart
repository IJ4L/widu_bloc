import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/bloc/auth_bloc/auth_bloc.dart';
import 'package:widyaedu/bloc/gender_bloc.dart';
import 'package:widyaedu/shared/theme.dart';

import '../widgets/card_info_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 45.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: kWhiteColor,
                    ),
                  ),
                  Text(
                    'Akun Saya',
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is Authenticated) {
                  final data = state.userData;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 149.r,
                          width: 149.r,
                          margin: EdgeInsets.only(bottom: 45.h),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                state.userData.userFoto,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(149.r / 2),
                            boxShadow: [
                              BoxShadow(
                                color: kBlackColor.withOpacity(0.2),
                                blurRadius: 6,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CardInfoProfile(
                          title: 'Nama Lengkap', subtitle: data.userName),
                      CardInfoProfile(title: 'Email', subtitle: data.userEmail),
                      CardInfoProfile(
                          title: 'Jenis Kelamin', subtitle: data.userGender),
                      CardInfoProfile(title: 'Kelas', subtitle: data.kelas),
                      CardInfoProfile(
                          title: 'Nama Sekolah',
                          subtitle: data.userAsalSekolah),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<GenderBloc>()
                              .add(EditGender(data.userGender));
                          Navigator.pushNamed(
                            context,
                            '/register',
                            arguments: {
                              'edit': 'true',
                              'nama': data.userName,
                              'email': data.userEmail,
                              'kelas': data.kelas,
                              'namaSekolah': data.userAsalSekolah,
                              'foto': data.userFoto,
                              'redirect': 'true',
                            },
                          );
                        },
                        child: Center(
                          child: Text(
                            'Edit Akun',
                            style: whiteTextStyle.copyWith(
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                              shadows: [defaultShadow],
                            ),
                            textScaleFactor: 1,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
            SizedBox(height: 19.h),
            GestureDetector(
              onTap: () {
                context.read<AuthBloc>().add(LogoutEvent());
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Center(
                child: Text(
                  'Logout Akun',
                  style: redkTextStyle.copyWith(
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
