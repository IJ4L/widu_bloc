import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:widyaedu/models/user_model.dart';

class AuthServices {
  final http.Client client;
  AuthServices({required this.client});

  Future<Either<String, UserModel>> getDataUser(String email) async {
    final response = await client.get(
      Uri.parse('https://edspert.widyaedu.com/users?email=$email'),
      headers: {'X-API-Key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
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

  Future<String> register(String email, String namaLengkap, String namaSekolah,
      String kelas, String gender) async {
    final response = await client.post(
      Uri.parse('https://edspert.widyaedu.com/users/registrasi'),
      headers: {'X-API-Key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
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
