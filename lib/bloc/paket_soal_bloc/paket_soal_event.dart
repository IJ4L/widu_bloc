part of 'paket_soal_bloc.dart';

abstract class PaketSoalEvent extends Equatable {
  const PaketSoalEvent();

  @override
  List<Object> get props => [];
}

class LoadPaketEvent extends PaketSoalEvent {
  final String courseId, email;
  const LoadPaketEvent(this.courseId, this.email);
}
