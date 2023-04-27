import 'package:bloc/bloc.dart';

abstract class ChoiceEvent {}

class Initial extends ChoiceEvent {}

class SelectA extends ChoiceEvent {}

class SelectB extends ChoiceEvent {}

class SelectC extends ChoiceEvent {}

class SelectD extends ChoiceEvent {}

class SelectE extends ChoiceEvent {}

class ChoiceBloc extends Bloc<ChoiceEvent, String> {
  ChoiceBloc() : super('') {
    on<SelectA>((event, emit) => emit('A'));
    on<SelectB>((event, emit) => emit('B'));
    on<SelectC>((event, emit) => emit('C'));
    on<SelectD>((event, emit) => emit('D'));
    on<SelectE>((event, emit) => emit('E'));
    on<Initial>((event, emit) => emit(''));
  }
}
