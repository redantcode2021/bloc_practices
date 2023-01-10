import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio_interceptor/data/services/locator.dart';
import 'package:dio_interceptor/data/sharedprefs/shared_preference_helper.dart';
import 'package:equatable/equatable.dart';

import 'package:dio_interceptor/data/repository/home_repository.dart';
import 'package:dio_interceptor/model/user.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  final sharedPrefLocator = getIt.get<SharedPreferenceHelper>();
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<LoadUserEvent>(_loadUser);
  }

  Future<FutureOr<void>> _loadUser(
    LoadUserEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeLoading());
      final users = await homeRepository.getAllUsers();
      //print(users.length);
      emit(HomeLoaded(users: users));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
