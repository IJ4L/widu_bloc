part of 'soal_bloc.dart';

abstract class SoalEvent extends Equatable {
  const SoalEvent();

  @override
  List<Object> get props => [];
}

class LoadSoalEvent extends SoalEvent {
  final String exerciseId, email;
  const LoadSoalEvent(this.exerciseId, this.email);

  @override
  List<Object> get props => [exerciseId, email];
}

class AnswerSoalEvent extends SoalEvent {
  final String exerciseId, email, bankQuestion, answer;
  const AnswerSoalEvent(
    this.exerciseId,
    this.email,
    this.bankQuestion,
    this.answer,
  );

  @override
  List<Object> get props => [exerciseId, email, bankQuestion, answer];
}
