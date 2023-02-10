part of 'trending_tv_show_weekly_bloc.dart';

abstract class TrendingTvShowWeeklyState extends Equatable {
  const TrendingTvShowWeeklyState();

  @override
  List<Object> get props => [];
}

class TrendingTvShowWeeklyInitial extends TrendingTvShowWeeklyState {}

class TrendingTvShowListWeekly extends TrendingTvShowWeeklyState {
  final List<Movie> list;
  const TrendingTvShowListWeekly(
    this.list,
  );
}
