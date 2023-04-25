import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:widyaedu/models/banner_model.dart';

class BannerService {
  final http.Client client;
  BannerService({required this.client});

  final String bannerBaseUrl = 'https://api.widyaedu.com/event/list';
  final String apiKeyBanner = '18be70c0-4e4d-44ff-a475-50c51ece99a3';

  Future<Either<String, BannerModel>> getAllBanner() async {
    final response = await client.get(
      Uri.parse(bannerBaseUrl),
      headers: {'X-API-Key': apiKeyBanner},
    );

    if (response.statusCode == 200) {
      return Right(BannerModel.fromJson(jsonDecode(response.body)));
    } else {
      return const Left('Something wrong');
    }
  }
}
