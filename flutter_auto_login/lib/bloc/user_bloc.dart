import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_auto_login/models/user.dart';
import 'package:flutter_auto_login/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserSignedOut()) {
    on<SignIn>(_onSignIn);
    on<SignOut>(_onSignOut);
    on<CheckSignInStatus>(_onCheckSignInStatus);
  }

  FutureOr<void> _onSignIn(
    SignIn event,
    Emitter<UserState> emit,
  ) async {
    if (state is UserSignedOut) {
      String? token =
          Services.getToken(email: event.email, password: event.password);

      if (token != null) {
        User? user = Services.getUser(email: event.email, token: token);

        if (user != null) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('email', event.email);
          pref.setString('token', token);
          emit(UserSignedIn(user: user));
        }
      }
    }
  }

  FutureOr<void> _onSignOut(
    SignOut event,
    Emitter<UserState> emit,
  ) async {
    if (state is UserSignedIn) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove("email");
      pref.remove("token");

      emit(UserSignedOut());
    }
  }

  FutureOr<void> _onCheckSignInStatus(
    CheckSignInStatus event,
    Emitter<UserState> emit,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? email = pref.getString('email');
    String? token = pref.getString('token');

    if (email != null && token != null) {
      bool tokenValid = Services.isTokenValid(token);

      if (tokenValid) {
        User? user = Services.getUser(email: email, token: token);

        if (user != null) {
          emit(UserSignedIn(user: user));
        }
      }
    }
  }
}
