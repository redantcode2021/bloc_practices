part of 'trending_tv_show_daily_bloc.dart';

abstract class TrendingTvShowDailyState extends Equatable {
  const TrendingTvShowDailyState();

  @override
  List<Object> get props => [];
}

class TrendingTvShowDailyInitial extends TrendingTvShowDailyState {}

class TrendingTvShowListDaily extends TrendingTvShowDailyState {
  final List<Movie> list;
  const TrendingTvShowListDaily(
    this.list,
  );
}
