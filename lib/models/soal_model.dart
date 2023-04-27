// To parse this JSON data, do
//
//     final soalModel = soalModelFromJson
import 'dart:convert';

SoalModel soalModelFromJson(String str) => SoalModel.fromJson(json.decode(str));

class SoalModel {
  final String exerciseIdFk;
  final String bankQuestionId;
  final String questionTitle;
  final dynamic questionTitleImg;
  final String optionA;
  final dynamic optionAImg;
  final String optionB;
  final dynamic optionBImg;
  final String optionC;
  final dynamic optionCImg;
  final String optionD;
  final dynamic optionDImg;
  final String optionE;
  final dynamic optionEImg;
  final String studentAnswer;

  SoalModel({
    required this.exerciseIdFk,
    required this.bankQuestionId,
    required this.questionTitle,
    required this.questionTitleImg,
    required this.optionA,
    required this.optionAImg,
    required this.optionB,
    required this.optionBImg,
    required this.optionC,
    required this.optionCImg,
    required this.optionD,
    required this.optionDImg,
    required this.optionE,
    required this.optionEImg,
    required this.studentAnswer,
  });

  factory SoalModel.fromJson(Map<String, dynamic> json) => SoalModel(
        exerciseIdFk: json["exercise_id_fk"],
        bankQuestionId: json["bank_question_id"],
        questionTitle: json["question_title"],
        questionTitleImg: json["question_title_img"],
        optionA: json["option_a"],
        optionAImg: json["option_a_img"],
        optionB: json["option_b"],
        optionBImg: json["option_b_img"],
        optionC: json["option_c"],
        optionCImg: json["option_c_img"],
        optionD: json["option_d"],
        optionDImg: json["option_d_img"],
        optionE: json["option_e"],
        optionEImg: json["option_e_img"],
        studentAnswer: json["student_answer"],
      );
}
