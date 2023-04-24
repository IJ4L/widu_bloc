import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:widyaedu/models/mapel_model.dart';

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
      if (data['status'] == 0) {
        return Left(data['message']);
      }
      return Right(List<MapelModel>.from(
        data['data'].map((x) => MapelModel.fromJson(x)),
      ).toList());
    }
    return Left('Request failed with status: ${response.statusCode}');
  }
}
