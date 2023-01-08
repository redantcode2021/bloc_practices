part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  const LoginRequested({
    required this.email,
    required this.password,
  });
}

class LogInEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {}

class RegisterRequested extends AuthEvent {
  final String email;
  final String password;
  const RegisterRequested({
    required this.email,
    required this.password,
  });
}

class LogOutRequested extends AuthEvent {}
