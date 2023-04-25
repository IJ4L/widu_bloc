import 'dart:convert';

SkorModel skorModelFromJson(String str) => SkorModel.fromJson(json.decode(str));

class SkorModel {
  SkorModel({
    required this.jumlahBenar,
    required this.jumlahSalah,
    required this.jumlahTidak,
    required this.jumlahScore,
  });

  final String jumlahBenar;
  final String jumlahSalah;
  final String jumlahTidak;
  final String jumlahScore;

  factory SkorModel.fromJson(Map<String, dynamic> json) => SkorModel(
        jumlahBenar: json["jumlah_benar"],
        jumlahSalah: json["jumlah_salah"],
        jumlahTidak: json["jumlah_tidak"],
        jumlahScore: json["jumlah_score"],
      );
}
