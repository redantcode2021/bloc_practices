import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:netflix/data/repository/movie_repository.dart';
import 'package:netflix/model/configuration.dart';

part 'configuration_event.dart';
part 'configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final MovieRepository movieRepository;
  ConfigurationBloc({required this.movieRepository})
      : super(const ConfigurationState()) {
    on<FetchConfiguration>((event, emit) async {
      emit(ConfigurationState(data: await movieRepository.getConfiguration()));
    });
  }
}
