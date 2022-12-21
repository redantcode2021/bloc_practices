part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class _AuthenticationStatusChanged extends AuthenticationEvent {
  final AuthenticationStatus status;
  _AuthenticationStatusChanged(
    this.status,
  );
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
