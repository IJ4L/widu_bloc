part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoadingAuth extends AuthState {}

class Authenticated extends AuthState {
  final UserModel userData;
  const Authenticated(this.userData);

  @override
  List<Object> get props => [userData];
}

class Unauthenticated extends AuthState {
  final String message;
  const Unauthenticated(this.message);

  @override
  List<Object> get props => [message];
}

class SucsessRegister extends AuthState {
  final String status;
  const SucsessRegister(this.status);

  @override
  List<Object> get props => [status];
}

class FailedRegister extends AuthState {
  final String message;
  const FailedRegister(this.message);

  @override
  List<Object> get props => [message];
}
