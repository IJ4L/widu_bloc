part of 'mapel_bloc.dart';

abstract class MapelEvent extends Equatable {
  const MapelEvent();

  @override
  List<Object> get props => [];
}

class LoadMapelEvent extends MapelEvent {
  final String email;
  const LoadMapelEvent(this.email);
}
