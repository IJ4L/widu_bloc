part of 'soal_bloc.dart';

abstract class SoalState extends Equatable {
  const SoalState();

  @override
  List<Object> get props => [];
}

class SoalInitial extends SoalState {}

class SoalLoading extends SoalState {}

class SoalLoaded extends SoalState {
  final List<SoalModel> allSoal;
  const SoalLoaded(this.allSoal);

  @override
  List<Object> get props => [allSoal];
}

class SoalAnswered extends SoalState {
  final String message;
  const SoalAnswered(this.message);

  @override
  List<Object> get props => [message];
}

class SoalFailure extends SoalState {
  final String message;
  const SoalFailure(this.message);

  @override
  List<Object> get props => [message];
}

class SoalGetSkor extends SoalState {
  final SkorModel skor;
  const SoalGetSkor(this.skor);

  @override
  List<Object> get props => [skor];
}
