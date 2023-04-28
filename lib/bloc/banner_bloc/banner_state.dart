part of 'banner_bloc.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerLoaded extends BannerState {
  final List<BannerModel> allBanner;
  const BannerLoaded(this.allBanner);

  @override
  List<Object> get props => [allBanner];
}

class BannerFailure extends BannerState {
  final String message;
  const BannerFailure(this.message);

  @override
  List<Object> get props => [message];
}
