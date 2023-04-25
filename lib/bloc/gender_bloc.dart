import 'package:bloc/bloc.dart';

abstract class GenderEvent {}

class SelectLakiLakiEvent extends GenderEvent {}

class SelectPerempuanEvent extends GenderEvent {}

class GenderBloc extends Bloc<GenderEvent, String> {
  GenderBloc() : super('Perempuan') {
    on<SelectLakiLakiEvent>((event, emit) => emit('Laki-Laki'));
    on<SelectPerempuanEvent>((event, emit) => emit('Perempuan'));
  }
}
