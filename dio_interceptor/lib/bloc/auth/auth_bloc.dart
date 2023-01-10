import 'dart:async';
import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio_interceptor/data/services/locator.dart';
import 'package:dio_interceptor/data/sharedprefs/shared_preference_helper.dart';
import 'package:equatable/equatable.dart';

import 'package:dio_interceptor/data/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final locator = getIt.get<SharedPreferenceHelper>();
  AuthBloc({required this.authRepository}) : super(NotLoggedIn()) {
    on<LoginRequested>(_loginUser);
    on<RegisterRequested>(_registerUser);
    on<RegisterEvent>((event, emit) => emit(NotRegistered()));
    on<LogInEvent>((event, emit) => emit(NotLoggedIn()));
    on<LogOutRequested>(_logOutUser);
  }

  final AuthRepository authRepository;

  FutureOr<void> _loginUser(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    try {
      final res = await authRepository.login(
        email: event.email,
        password: event.password,
      );
      if (res['token'].toString().isNotEmpty) {
        await locator.setUserToken(userToken: res['token']).then((value) {
          emit(LoggedInSuccessfully());
        });
      } else {
        emit(LoggedInFailed(error: res['error']));
        emit(NotLoggedIn());
      }
    } catch (e) {
      emit(LoggedInFailed(error: e.toString()));
      emit(NotLoggedIn());
    }
  }

  FutureOr<void> _registerUser(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    try {
      final res = await authRepository.register(
        email: event.email,
        password: event.password,
      );
      if (res['token'].toString().isNotEmpty) {
        emit(RegisterSuccessfully());
        emit(NotLoggedIn());
      } else {
        emit(RegisteredFailed(error: res['error']));
        emit(NotRegistered());
      }
    } catch (e) {
      emit(RegisteredFailed(error: e.toString()));
      emit(NotRegistered());
    }
  }

  Future<FutureOr<void>> _logOutUser(
    LogOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await locator.prefs.clear();
    emit(NotLoggedIn());
  }
}
