part of 'paket_soal_bloc.dart';

abstract class PaketSoalState extends Equatable {
  const PaketSoalState();

  @override
  List<Object> get props => [];
}

class PaketSoalInitial extends PaketSoalState {}

class PaketSoalLoading extends PaketSoalState {}

class PaketSoalLoaded extends PaketSoalState {
  final List<PaketModel> allPaketMapel;
  const PaketSoalLoaded(this.allPaketMapel);

  @override
  List<Object> get props => [allPaketMapel];
}

class PaketSoalFailure extends PaketSoalState {
  final String message;
  const PaketSoalFailure(this.message);

  @override
  List<Object> get props => [message];
}
