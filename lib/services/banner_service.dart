import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:widyaedu/models/banner_model.dart';

class BannerService {
  final http.Client client;
  BannerService({required this.client});

  Future<Either<String, BannerModel>> getAllBanner() async {
    final response = await client.get(
      Uri.parse('https://api.widyaedu.com/event/list'),
      headers: {'X-API-Key': '18be70c0-4e4d-44ff-a475-50c51ece99a3'},
    );

    if (response.statusCode == 200) {
      return Right(BannerModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Something wrong');
    }
  }
}
