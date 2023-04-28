import 'dart:convert';

PaketModel paketModelFromJson(String str) =>
    PaketModel.fromJson(json.decode(str));

class PaketModel {
  PaketModel({
    required this.exerciseId,
    required this.exerciseTitle,
    required this.accessType,
    required this.icon,
    required this.exerciseUserStatus,
    required this.jumlahSoal,
    required this.jumlahDone,
  });

  final String exerciseId;
  final String exerciseTitle;
  final String accessType;
  final String icon;
  final String exerciseUserStatus;
  final String jumlahSoal;
  final int jumlahDone;

  factory PaketModel.fromJson(Map<String, dynamic> json) => PaketModel(
        exerciseId: json["exercise_id"],
        exerciseTitle: json["exercise_title"],
        accessType: json["access_type"],
        icon: json["icon"],
        exerciseUserStatus: json["exercise_user_status"],
        jumlahSoal: json["jumlah_soal"],
        jumlahDone: json["jumlah_done"],
      );
}
