import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix/data/repository/movie_repository.dart';

import '../../../../../model/model_barrel.dart';

part 'trending_tv_show_weekly_event.dart';
part 'trending_tv_show_weekly_state.dart';

class TrendingTvShowWeeklyBloc
    extends Bloc<TrendingTvShowWeeklyEvent, TrendingTvShowWeeklyState> {
  final MovieRepository movieRepository;
  TrendingTvShowWeeklyBloc({required this.movieRepository})
      : super(TrendingTvShowWeeklyInitial()) {
    on<FetchingTrendingTvShowListWeekly>((event, emit) async {
      emit(TrendingTvShowListWeekly(
          await movieRepository.getTrending(type: 'tv')));
    });
  }
}
