import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:widyaedu/models/mapel_model.dart';
import 'package:widyaedu/services/latihan_soal_service.dart';

part 'mapel_event.dart';
part 'mapel_state.dart';

class MapelBloc extends Bloc<MapelEvent, MapelState> {
  final LatihanSoalService latihanSoalService;
  MapelBloc({required this.latihanSoalService}) : super(MapelInitial()) {
    on<LoadMapelEvent>((event, emit) async {
      emit(MapelLoading());
      final result = await latihanSoalService.getAllMapel(event.email);

      result.fold(
        (message) => emit(MapelFailure()),
        (data) => emit(MapelLoaded(data)),
      );
    });
  }
}
