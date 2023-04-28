import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:widyaedu/models/banner_model.dart';
import 'package:widyaedu/services/banner_service.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerService bannerService;
  BannerBloc({required this.bannerService}) : super(BannerInitial()) {
    on<LoadBannerEvent>((event, emit) async {
      emit(BannerLoading());
      final result = await bannerService.getAllBanner();

      result.fold(
        (message) => emit(BannerFailure(message)),
        (allBanner) => emit(BannerLoaded(allBanner)),
      );
    });
  }
}
