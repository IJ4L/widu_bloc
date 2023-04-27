part of 'mapel_bloc.dart';

abstract class MapelState extends Equatable {
  const MapelState();

  @override
  List<Object> get props => [];
}

class MapelInitial extends MapelState {}

class MapelLoading extends MapelState {}

class MapelLoaded extends MapelState {
  final List<MapelModel> allMapel;
  const MapelLoaded(this.allMapel);

  @override
  List<Object> get props => [allMapel];
}

class MapelFailure extends MapelState {}
