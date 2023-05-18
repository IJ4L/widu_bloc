import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:widyaedu/models/banner_model.dart';

class BannerService {
  final http.Client client;
  BannerService({required this.client});

  final String bannerBaseUrl = 'Your-api';
  final String apiKeyBanner = 'Key-api';

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
