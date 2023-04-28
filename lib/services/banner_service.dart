import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:widyaedu/models/banner_model.dart';

class BannerService {
  final http.Client client;
  BannerService({required this.client});

  final String bannerBaseUrl = 'https://api.widyaedu.com/event/list';
  final String apiKeyBanner = '18be70c0-4e4d-44ff-a475-50c51ece99a3';

  Future<Either<String, List<BannerModel>>> getAllBanner() async {
    final response = await client.get(
      Uri.parse(bannerBaseUrl),
      headers: {'X-API-Key': apiKeyBanner},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) return Left(data['message']);
      return Right(List<BannerModel>.from(
        data['data'].map((x) => BannerModel.fromJson(x)),
      ).toList());
    }
    return Left('Request failed with status: ${response.statusCode}');
  }
}
