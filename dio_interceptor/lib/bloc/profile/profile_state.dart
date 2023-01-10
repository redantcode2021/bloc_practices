part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String firstName;
  const ProfileLoaded({
    required this.firstName,
  });
}

class ProfileErrror extends ProfileState {
  final String message;
  const ProfileErrror({
    required this.message,
  });
}
