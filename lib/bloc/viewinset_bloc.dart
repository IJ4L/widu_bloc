import 'package:bloc/bloc.dart';

abstract class ViewInset {}

class Initial extends ViewInset {}

class OnEvent extends ViewInset {}

class ViewSet extends Bloc<ViewInset, double> {
  ViewSet() : super(0) {
    on<OnEvent>((event, emit) => emit(140));
    on<Initial>((event, emit) => emit(0));
  }
}
