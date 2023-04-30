import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:widyaedu/models/user_model.dart';
import 'package:widyaedu/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthServices authServices;
  AuthBloc({required this.authServices}) : super(AuthInitial()) {
    on<LoggedInEvent>((event, emit) async {
      emit(LoadingAuth());
      final result = await authServices.loginUser();

      result.fold(
        (message) => emit(Unauthenticated(message)),
        (data) => emit(Authenticated(data)),
      );
    });
    on<RegisterEvent>((event, emit) async {
      emit(LoadingAuth());
      final result = await authServices.register(event.email, event.namaLengkap,
          event.namaSekolah, event.kelas, event.gender);

      result.fold(
        (message) => emit(FailedRegister(message)),
        (status) => emit(SucsessRegister(status)),
      );
    });
    on<EditProfileEvent>((event, emit) async {
      emit(LoadingAuth());
      final result = await authServices.updateDataUser(
        event.email,
        event.namaLengkap,
        event.namaSekolah,
        event.kelas,
        event.gender,
        event.foto,
      );

      result.fold((message) => emit(Unauthenticated(message)),
          (data) => emit(Authenticated(data)));
    });
    on<AutoLoginEvent>((event, emit) async {
      emit(LoadingAuth());
      final result = await authServices.autoLogin();

      result.fold((notUse) => null, (data) {
        emit(Authenticated(data));
      });
    });
    on<LogoutEvent>((event, emit) async => await authServices.signOut());
  }
}
