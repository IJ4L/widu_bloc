import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:widyaedu/models/pembahasan_soal_model.dart';
import 'package:widyaedu/models/skor_model.dart';
import 'package:widyaedu/models/soal_model.dart';
import 'package:widyaedu/services/latihan_soal_service.dart';

part 'soal_event.dart';
part 'soal_state.dart';

class SoalBloc extends Bloc<SoalEvent, SoalState> {
  final LatihanSoalService latihanSoalService;
  SoalBloc({required this.latihanSoalService}) : super(SoalInitial()) {
    on<LoadSoalEvent>((event, emit) async {
      emit(SoalLoading());
      final result =
          await latihanSoalService.getAllSoal(event.exerciseId, event.email);

      result.fold(
        (message) => emit(SoalFailure(message)),
        (data) => emit(SoalLoaded(data)),
      );
    });
    on<AnswerSoalEvent>((event, emit) async {
      latihanSoalService.inputJawaban(
        event.exerciseId,
        event.email,
        event.bankQuestion,
        event.answer,
      );
    });
    on<LoadSkorEvent>((event, emit) async {
      emit(SoalLoading());
      final result =
          await latihanSoalService.getDataSkor(event.exerciseId, event.email);

      result.fold(
        (l) => null,
        (skor) => emit(SoalGetSkor(skor)),
      );
    });
    on<LoadPembahasanEvent>((event, emit) async {
      emit(SoalLoading());
      final result = await latihanSoalService.getAllPembahasanSoal(
          event.exerciseId, event.email);

      result.fold(
        (message) => emit(SoalFailure(message)),
        (data) => emit(
          LoadPembahasan(data),
        ),
      );
    });
    on<DoneTestEvent>((event, emit) async {
      await latihanSoalService.doneTest(event.email, event.exerciseId);
    });
  }
}
