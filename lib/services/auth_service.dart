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

  final String userBaseUrl = 'Your-api';
  final String apiKeyUser = 'Key-api';

  GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? currentUser;
  UserCredential? userCredential;

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

    UserModel user;

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
      return data.fold(
        (message) {
          return Left(currentUser!.email);
        },
        (data) {
          if (data.userFoto == 'url foto') {
            updateDataUser(
              data.userEmail,
              data.userName,
              data.userAsalSekolah,
              data.kelas,
              data.userGender,
              currentUser!.photoUrl.toString(),
            );

            user = UserModel(
              iduser: data.iduser,
              userName: data.userName,
              userEmail: data.userEmail,
              userFoto: currentUser!.photoUrl.toString(),
              userAsalSekolah: data.userAsalSekolah,
              kelas: data.kelas,
              dateCreate: data.dateCreate,
              userGender: data.userGender,
              userStatus: data.userStatus,
            );
            return Right(user);
          }
          user = data;
          return Right(user);
        },
      );
    }
    return const Left('Gagal Login');
  }

  Future<Either<String, String>> register(String email, String namaLengkap,
      String namaSekolah, String kelas, String gender) async {
    final response = await client.post(
      Uri.parse('$userBaseUrl/registrasi'),
      headers: {'X-API-Key': apiKeyUser},
      body: {
        'email': email,
        'nama_lengkap': namaLengkap,
        'gender': gender,
        'kelas': kelas,
        'nama_sekolah': namaSekolah,
        'foto': 'url foto',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) return Left(data['message']);
    }

    return const Right('Sucsess Register');
  }

  Future<Either<String, UserModel>> autoLogin() async {
    UserModel user;

    final isSignIn = await googleSignIn.isSignedIn();

    if (isSignIn) {
      await googleSignIn.signInSilently().then((value) => currentUser = value);

      final data = await getDataUser(currentUser!.email);

      return data.fold(
        (message) {
          return Left(currentUser!.email);
        },
        (data) {
          if (data.userFoto == 'url foto') {
            updateDataUser(
              data.userEmail,
              data.userName,
              data.userAsalSekolah,
              data.kelas,
              data.userGender,
              currentUser!.photoUrl.toString(),
            );

            user = UserModel(
              iduser: data.iduser,
              userName: data.userName,
              userEmail: data.userEmail,
              userFoto: currentUser!.photoUrl.toString(),
              userAsalSekolah: data.userAsalSekolah,
              kelas: data.kelas,
              dateCreate: data.dateCreate,
              userGender: data.userGender,
              userStatus: data.userStatus,
            );
            return Right(user);
          }
          user = data;
          return Right(user);
        },
      );
    }
    return const Left('Gagal Login');
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
  }
}
