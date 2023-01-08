part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class Loading extends AuthState {
  @override
  List<Object> get props => [];
}

class LoggedInSuccessfully extends AuthState {
  @override
  List<Object> get props => [];
}

class NotLoggedIn extends AuthState {
  @override
  List<Object> get props => [];
}

class LoggedInFailed extends AuthState {
  final String error;
  const LoggedInFailed({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

class RegisterSuccessfully extends AuthState {
  @override
  List<Object> get props => [];
}

class NotRegistered extends AuthState {
  @override
  List<Object> get props => [];
}

class RegisteredFailed extends AuthState {
  final String error;
  const RegisteredFailed({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
