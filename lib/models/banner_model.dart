// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

class BannerModel {
  BannerModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final int status;
  final String message;
  final List<Datum> data;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    required this.eventId,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventImage,
    required this.eventUrl,
  });

  final String eventId;
  final String eventTitle;
  final String eventDescription;
  final String eventImage;
  final String eventUrl;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        eventId: json["event_id"],
        eventTitle: json["event_title"],
        eventDescription: json["event_description"],
        eventImage: json["event_image"],
        eventUrl: json["event_url"],
      );
}
