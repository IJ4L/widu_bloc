import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.iduser,
    required this.userName,
    required this.userEmail,
    required this.userFoto,
    required this.userAsalSekolah,
    required this.kelas,
    required this.dateCreate,
    required this.userGender,
    required this.userStatus,
  });

  final String iduser;
  final String userName;
  final String userEmail;
  final String userFoto;
  final String userAsalSekolah;
  final String kelas;
  final DateTime dateCreate;
  final String userGender;
  final String userStatus;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        iduser: json["iduser"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userFoto: json["user_foto"],
        userAsalSekolah: json["user_asal_sekolah"],
        kelas: json["kelas"],
        dateCreate: DateTime.parse(json["date_create"]),
        userGender: json["user_gender"],
        userStatus: json["user_status"],
      );

  Map<String, dynamic> toJson() => {
        "iduser": iduser,
        "user_name": userName,
        "user_email": userEmail,
        "user_foto": userFoto,
        "user_asal_sekolah": userAsalSekolah,
        "kelas": kelas,
        "date_create": dateCreate.toIso8601String(),
        "user_gender": userGender,
        "user_status": userStatus,
      };
}
