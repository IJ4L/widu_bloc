import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:widyaedu/models/paket_soal_model.dart';
import 'package:widyaedu/services/latihan_soal_service.dart';

part 'paket_soal_event.dart';
part 'paket_soal_state.dart';

class PaketSoalBloc extends Bloc<PaketSoalEvent, PaketSoalState> {
  final LatihanSoalService latihanSoalService;
  PaketSoalBloc({required this.latihanSoalService})
      : super(PaketSoalInitial()) {
    on<LoadPaketEvent>((event, emit) async {
      emit(PaketSoalLoading());
      final result =
          await latihanSoalService.getAllPaketSoal(event.courseId, event.email);

      result.fold(
        (message) => emit(PaketSoalFailure(message)),
        (data) => emit(PaketSoalLoaded(data)),
      );
    });
  }
}
