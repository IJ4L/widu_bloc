// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:widyaedu/models/user_model.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final http.Client client;
  AuthServices({required this.client});

  final String userBaseUrl = 'https://edspert.widyaedu.com/users';
  final String apiKeyUser = '18be70c0-4e4d-44ff-a475-50c51ece99a0';

  Future<Either<String, UserModel>> getDataUser(String email) async {
    final response = await client.get(
      Uri.parse('$userBaseUrl?email=$email'),
      headers: {'X-API-Key': apiKeyUser},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) {
        return Left(data['message']);
      }
      return Right(UserModel.fromJson(data['data']));
    }

    return Left('Request failed with status: ${response.statusCode}');
  }

  Future<Either<String, UserModel>> updateDataUser(
      String email,
      String namaLengkap,
      String namaSekolah,
      String kelas,
      String gender,
      String foto) async {
    final response =
        await client.post(Uri.parse('$userBaseUrl/update'), headers: {
      'X-API-Key': apiKeyUser
    }, body: {
      'email': email,
      'nama_lengkap': namaLengkap,
      'gender': gender,
      'kelas': kelas,
      'nama_sekolah': namaSekolah,
      'foto': foto,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) {
        return Left(data['message']);
      }
      return Right(UserModel.fromJson(data['data']));
    }

    return Left('Request failed with status: ${response.statusCode}');
  }

  Future<Either<String, UserModel>> loginUser() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? currentUser;
    UserCredential? userCredential;

    await googleSignIn.signOut();
    await googleSignIn.signIn().then((value) => currentUser = value);

    final isSignIn = await googleSignIn.isSignedIn();

    if (isSignIn) {
      final googleAuth = await currentUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => userCredential = value);

      final data = await getDataUser(currentUser!.email);
      data.fold(
        (l) {},
        (r) {
          if (r.userFoto == 'url foto') {
            updateDataUser(r.userEmail, r.userName, r.userAsalSekolah, r.kelas,
                r.userGender, currentUser!.photoUrl.toString());
          }
        },
      );
    }
    return const Left('');
  }

  Future<String> register(String email, String namaLengkap, String namaSekolah,
      String kelas, String gender) async {
    final response = await client.post(
      Uri.parse('$userBaseUrl/registrasi'),
      headers: {'X-API-Key': apiKeyUser},
      body: {
        'email': email,
        'nama_lengkap': namaLengkap,
        'gender': gender,
        'kelas': kelas,
        'nama_sekolah': namaSekolah,
        'foto': '',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) return data['message'];
    }

    return 'Berhasil Mendaftar';
  }
}
