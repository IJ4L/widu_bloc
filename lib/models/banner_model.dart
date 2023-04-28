import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

class BannerModel {
  final String eventId;
  final String eventTitle;
  final String eventDescription;
  final String eventImage;
  final String eventUrl;

  BannerModel({
    required this.eventId,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventImage,
    required this.eventUrl,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        eventId: json["event_id"],
        eventTitle: json["event_title"],
        eventDescription: json["event_description"],
        eventImage: json["event_image"],
        eventUrl: json["event_url"],
      );
}
