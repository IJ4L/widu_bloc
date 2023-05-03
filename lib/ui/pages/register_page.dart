import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/bloc/auth_bloc/auth_bloc.dart';
import 'package:widyaedu/bloc/gender_bloc.dart';
import 'package:widyaedu/bloc/viewinset_bloc.dart';
import 'package:widyaedu/shared/theme.dart';
import 'package:widyaedu/ui/widgets/costume_appbar.dart';
import 'package:widyaedu/ui/widgets/costume_button.dart';

import '../widgets/costume_textfield_with_title.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> item =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController email = TextEditingController(
      text: item['edit'] == 'true'
          ? item['email']
          : item['redirect'] == 'true'
              ? item['email']
              : '',
    );
    final TextEditingController namaLengkap = TextEditingController(
      text: item['edit'] == 'true' ? item['nama'] : '',
    );
    final TextEditingController kelas = TextEditingController(
      text: item['edit'] == 'true' ? item['kelas'] : '',
    );
    final TextEditingController namaSekolah = TextEditingController(
      text: item['edit'] == 'true' ? item['namaSekolah'] : '',
    );

    final GenderBloc genderBloc = context.read<GenderBloc>();
    return Scaffold(
      backgroundColor: kWhiteColor,
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pop(context);
          }
          if (state is LoadingAuth) {}
        },
        child: BlocBuilder<ViewSet, double>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<ViewSet>().add(Initial());
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: ListView(
                padding: EdgeInsets.only(bottom: state.h),
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CostumeAppbar(
                          title: item['edit'] == 'true'
                              ? 'Edit Profile'
                              : 'Registrasi',
                        ),
                        CostumeTexfield(
                          title: 'Email',
                          controller: email,
                          validator: false,
                        ),
                        CostumeTexfield(
                          title: 'Nama Lengkap',
                          controller: namaLengkap,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 37.w),
                          child: Text(
                            'Jenis Kelamin',
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: regular,
                            ),
                            textScaleFactor: 1,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        BlocBuilder<GenderBloc, String>(
                          builder: (context, state) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: 37.w,
                                right: 37.w,
                                bottom: 25.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                        GestureDetector(
                          onTap: () => context.read<ViewSet>().add(OnEvent()),
                          child: CostumeTexfield(
                            title: 'Nama Sekolah',
                            controller: namaSekolah,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        BlocConsumer<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state is SucsessRegister) {
                              Navigator.pop(context);
                            }
                            if (state is FailedRegister) {}
                          },
                          builder: (context, state) {
                            return Center(
                              child: CostumeButton(
                                title: item['edit'] == 'true'
                                    ? 'Perbarui'
                                    : 'Daftar',
                                height: 45.h,
                                width: 127.w,
                                radius: 10,
                                color: kSecondColor,
                                colorTitle: kWhiteColor,
                                blurRadius: 1,
                                spreadRadius: 1,
                                fontWeight: bold,
                                ontap: () {
                                  if (formKey.currentState!.validate()) {
                                    item['edit'] == 'true'
                                        ? context.read<AuthBloc>().add(
                                              EditProfileEvent(
                                                email.text,
                                                namaLengkap.text,
                                                namaSekolah.text,
                                                kelas.text,
                                                context
                                                    .read<GenderBloc>()
                                                    .state,
                                                item['foto'],
                                              ),
                                            )
                                        : context.read<AuthBloc>().add(
                                              RegisterEvent(
                                                email.text,
                                                namaLengkap.text,
                                                genderBloc.state,
                                                kelas.text,
                                                namaSekolah.text,
                                              ),
                                            );
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
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
