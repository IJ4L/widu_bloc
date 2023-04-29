import 'package:bloc/bloc.dart';

abstract class GenderEvent {}

class SelectLakiLakiEvent extends GenderEvent {}

class SelectPerempuanEvent extends GenderEvent {}

class EditGender extends GenderEvent {
  final String gender;
  EditGender(this.gender);
}

class GenderBloc extends Bloc<GenderEvent, String> {
  GenderBloc() : super('Perempuan') {
    on<SelectLakiLakiEvent>((event, emit) => emit('Laki-Laki'));
    on<SelectPerempuanEvent>((event, emit) => emit('Perempuan'));
    on<EditGender>((event, emit) => emit(event.gender));
  }
}
