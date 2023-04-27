import 'package:bloc/bloc.dart';

abstract class ChangeEvent {}

class NextEvent extends ChangeEvent {}

class PreviousEvent extends ChangeEvent {}

class ChangeBloc extends Bloc<ChangeEvent, int> {
  ChangeBloc() : super(0) {
    on<NextEvent>((event, emit) => emit(state + 1));
    on<PreviousEvent>((event, emit) => emit(state - 1));
  }
}
