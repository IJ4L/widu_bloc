part of 'soal_bloc.dart';

abstract class SoalEvent extends Equatable {
  const SoalEvent();

  @override
  List<Object> get props => [];
}

class LoadSoalEvent extends SoalEvent {
  final String exerciseId, email;
  const LoadSoalEvent(this.exerciseId, this.email);
}
