import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:widyaedu/models/mapel_model.dart';
import 'package:widyaedu/models/paket_soal_model.dart';
import 'package:widyaedu/models/pembahasan_soal_model.dart';
import 'package:widyaedu/models/skor_model.dart';

import '../models/soal_model.dart';

class LatihanSoalService {
  final http.Client client;
  LatihanSoalService({required this.client});

  final String apiKey = '18be70c0-4e4d-44ff-a475-50c51ece99a0';
  final String baseUrl = 'https://edspert.widyaedu.com/exercise';

  Future<Either<String, List<MapelModel>>> getAllMapel(String email) async {
    final response = await client.get(
      Uri.parse('$baseUrl/data_course?user_email=$email'),
      headers: {'X-API-Key': apiKey},
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
      Uri.parse('$baseUrl/data_exercise?course_id=$courseId&user_email=$email'),
      headers: {'X-API-Key': apiKey},
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
      Uri.parse('$baseUrl/kerjakan'),
      headers: {'X-API-Key': apiKey},
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

  Future<String> inputJawaban(String exerciseId, String email,
      String bankQuestion, String answer) async {
    final response = await client.post(
      Uri.parse('$baseUrl/input_jawaban'),
      headers: {'X-API-Key': apiKey},
      body: {
        'exercise_id': exerciseId,
        'user_email': email,
        'bank_question_id[]': bankQuestion,
        'student_answer[]': answer,
      },
    );
    final data = jsonDecode(response.body);
    return '${data['message']}';
  }

  Future<Either<String, SkorModel>> getDataSkor(
      String exerciseId, String email) async {
    final response = await client.get(
      Uri.parse(
        '$baseUrl/score_result?exercise_id=$exerciseId&user_email=$email',
      ),
      headers: {'X-API-Key': apiKey},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) return Left(data['message']);
      return Right(SkorModel.fromJson(data['data']['result']));
    }
    return Left('Request failed with status: ${response.statusCode}');
  }

  Future<Either<String, List<PembahasanSoalModel>>> getAllPembahasanSoal(
      String exerciseId, String email) async {
    final response = await client.get(
      Uri.parse(
        '$baseUrl/pembahasan?exercise_id=$exerciseId&user_email=$email',
      ),
      headers: {'X-API-Key': apiKey},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) return Left(data['message']);
      return Right(List<PembahasanSoalModel>.from(
        data['data'].map((x) => PembahasanSoalModel.fromJson(x)),
      ).toList());
    }
    return Left('Request failed with status: ${response.statusCode}');
  }
}
