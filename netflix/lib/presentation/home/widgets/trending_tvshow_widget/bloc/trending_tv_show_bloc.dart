import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix/data/repository/movie_repository.dart';
import 'package:netflix/model/model_barrel.dart';

part 'trending_tv_show_event.dart';
part 'trending_tv_show_state.dart';

class TrendingTvShowBloc
    extends Bloc<TrendingTvShowEvent, TrendingTvShowState> {
  final MovieRepository movieRepository;
  TrendingTvShowBloc({required this.movieRepository})
      : super(TrendingTvShowInitial()) {
    on<FetchTrendingTvShowListWeekly>((event, emit) async {
      emit(TrendingTvShowListWeekly(
          list: await movieRepository.getTrending(type: 'tv')));
    });

    on<FetchTrendingTvShowListDaily>(
      (event, emit) async => emit(
        TrendingTvShowListDaily(
          list: await movieRepository.getTrending(type: 'tv', time: 'day'),
        ),
      ),
    );
  }
}
