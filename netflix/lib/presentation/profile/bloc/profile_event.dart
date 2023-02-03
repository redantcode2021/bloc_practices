part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class SelectProfile extends ProfileEvent {
  final int profile;
  const SelectProfile(
    this.profile,
  );
}
