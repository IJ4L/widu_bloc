part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoggedInEvent extends AuthEvent {}

class LoggedOutEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String email, namaLengkap;
  final String namaSekolah, kelas, gender;

  const RegisterEvent(
      this.email, this.namaLengkap, this.gender, this.kelas, this.namaSekolah);
}
