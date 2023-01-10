import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:dio_interceptor/data/repository/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc({required this.profileRepository}) : super(ProfileInitial()) {
    on<ProfileFetchEvent>(_fetchUserProfile);
  }

  Future<FutureOr<void>> _fetchUserProfile(
    ProfileFetchEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(ProfileLoading());
      final name = await profileRepository.getUserProfiles();
      emit(ProfileLoaded(firstName: name));
    } catch (e) {
      emit(ProfileErrror(message: e.toString()));
    }
  }
}
