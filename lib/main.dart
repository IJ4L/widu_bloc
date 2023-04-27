import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widyaedu/bloc/auth_bloc/auth_bloc.dart';
import 'package:widyaedu/bloc/gender_bloc.dart';
import 'package:widyaedu/bloc/mapel_bloc/mapel_bloc.dart';
import 'package:widyaedu/bloc/next_bloc.dart';
import 'package:widyaedu/bloc/paket_soal_bloc/paket_soal_bloc.dart';
import 'package:widyaedu/bloc/soal_bloc/soal_bloc.dart';
import 'package:widyaedu/services/auth_service.dart';
import 'package:widyaedu/services/latihan_soal_service.dart';
import 'package:widyaedu/ui/pages/all_mapel_page.dart';
import 'package:widyaedu/ui/pages/home_page.dart';
import 'package:widyaedu/ui/pages/login_page.dart';
import 'package:widyaedu/ui/pages/nilai_page.dart';
import 'package:widyaedu/ui/pages/paket_mapel_page.dart';
import 'package:widyaedu/ui/pages/pembahasan_soal_page.dart';
import 'package:widyaedu/ui/pages/profile_page.dart';
import 'package:widyaedu/ui/pages/register_page.dart';
import 'package:widyaedu/ui/pages/soal_page.dart';

import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderBloc()),
          BlocProvider(create: (context) => ChangeBloc()),
          BlocProvider(
            create: (context) => AuthBloc(
              authServices: AuthServices(client: http.Client()),
            ),
          ),
          BlocProvider(
            create: (context) => MapelBloc(
              latihanSoalService: LatihanSoalService(client: http.Client()),
            ),
          ),
          BlocProvider(
            create: (context) => PaketSoalBloc(
              latihanSoalService: LatihanSoalService(client: http.Client()),
            ),
          ),
          BlocProvider(
            create: (context) => SoalBloc(
              latihanSoalService: LatihanSoalService(client: http.Client()),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Poppins'),
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
            '/home': (context) => const HomePage(),
            '/profile': (context) => const ProfilePage(),
            '/nilai': (context) => const NilaiPage(),
            '/all-mapel': (context) => const AllMapelPage(),
            '/paket-mapel': (context) => const PaketMapelPage(),
            '/soal': (context) => const SoalPage(),
            '/pembahasan-soal': (context) => const PembahasanSoalPage(),
          },
        ),
      ),
    );
  }
}
