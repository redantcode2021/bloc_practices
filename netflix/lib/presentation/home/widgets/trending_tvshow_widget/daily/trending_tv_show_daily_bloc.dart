import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix/data/repository/movie_repository.dart';

import '../../../../../model/model_barrel.dart';

part 'trending_tv_show_daily_event.dart';
part 'trending_tv_show_daily_state.dart';

class TrendingTvShowDailyBloc
    extends Bloc<TrendingTvShowDailyEvent, TrendingTvShowDailyState> {
  final MovieRepository movieRepository;
  TrendingTvShowDailyBloc({required this.movieRepository})
      : super(TrendingTvShowDailyInitial()) {
    on<FetchingTrendingTvShowListDaily>((event, emit) async {
      emit(TrendingTvShowListDaily(
          await movieRepository.getTrending(type: 'tv', time: 'day')));
    });
  }
}
