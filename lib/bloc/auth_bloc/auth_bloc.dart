import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:widyaedu/models/user_model.dart';
import 'package:widyaedu/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthServices authServices;
  AuthBloc({required this.authServices}) : super(AuthInitial()) {
    on<LoggedIn>((event, emit) async {
      emit(LoadingAuth());
      final result = await authServices.loginUser();

      result.fold(
        (message) => emit(Unauthenticated(message)),
        (data) => emit(Authenticated(data)),
      );
    });
  }
}
