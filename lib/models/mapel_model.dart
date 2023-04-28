import 'dart:convert';

MapelModel mapelModelFromJson(String str) =>
    MapelModel.fromJson(json.decode(str));

class MapelModel {
  MapelModel({
    required this.courseId,
    required this.majorName,
    required this.courseCategory,
    required this.courseName,
    required this.urlCover,
    required this.jumlahMateri,
    required this.jumlahDone,
    required this.progress,
  });

  final String courseId;
  final String majorName;
  final String courseCategory;
  final String courseName;
  final String urlCover;
  final int jumlahMateri;
  final int jumlahDone;
  final int progress;

  factory MapelModel.fromJson(Map<String, dynamic> json) => MapelModel(
        courseId: json["course_id"],
        majorName: json["major_name"],
        courseCategory: json["course_category"],
        courseName: json["course_name"],
        urlCover: json["url_cover"],
        jumlahMateri: json["jumlah_materi"],
        jumlahDone: json["jumlah_done"],
        progress: json["progress"],
      );
}
