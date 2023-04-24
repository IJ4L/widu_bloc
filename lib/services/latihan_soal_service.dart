import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:widyaedu/models/mapel_model.dart';
import 'package:widyaedu/models/paket_soal_model.dart';
import 'package:widyaedu/models/soal_model.dart';

class LatihanSoalService {
  final http.Client client;
  LatihanSoalService({required this.client});

  Future<Either<String, List<MapelModel>>> getAllMapel(String email) async {
    final response = await client.get(
      Uri.parse(
        'https://edspert.widyaedu.com/exercise/data_course?user_email=$email',
      ),
      headers: {'X-API-Key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) return Left(data['message']);
      return Right(List<MapelModel>.from(
        data['data'].map((x) => MapelModel.fromJson(x)),
      ).toList());
    }
    return Left('Request failed with status: ${response.statusCode}');
  }

  Future<Either<String, List<PaketModel>>> getAllPaketSoal(
      String courseId, String email) async {
    final response = await client.get(
      Uri.parse(
        'https://edspert.widyaedu.com/exercise/data_exercise?course_id=$courseId&user_email=$email',
      ),
      headers: {'X-API-Key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) return Left(data['message']);
      return Right(List<PaketModel>.from(
        data['data'].map((x) => PaketModel.fromJson(x)),
      ).toList());
    }
    return Left('Request failed with status: ${response.statusCode}');
  }

  Future<Either<String, List<SoalModel>>> getAllSoal(
      String exerciseId, String email) async {
    final response = await client.post(
      Uri.parse(
        'https://edspert.widyaedu.com/exercise/kerjakan',
      ),
      headers: {'X-API-Key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
      body: {'exercise_id': exerciseId, 'user_email': email},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) return Left(data['message']);
      return Right(List<SoalModel>.from(
        data['data'].map((x) => SoalModel.fromJson(x)),
      ).toList());
    }
    return Left('Request failed with status: ${response.statusCode}');
  }
}
