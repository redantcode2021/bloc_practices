// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:multi_auth/data/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    // When the user presses the SignIn button, we will send the SignInRequested Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<SignInRequested>((event, emit) async {
      emit(LoadingState());
      try {
        await authRepository.signIn(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(error: e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(LoadingState());
      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(error: e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<GoogleSignInRequested>((event, emit) async {
      emit(LoadingState());
      try {
        await authRepository.signinWithGoogle();
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(error: e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignOutRequested>((event, emit) async {
      emit(LoadingState());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });
  }
}
