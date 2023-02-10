part of 'trending_tv_show_weekly_bloc.dart';

abstract class TrendingTvShowWeeklyEvent extends Equatable {
  const TrendingTvShowWeeklyEvent();

  @override
  List<Object> get props => [];
}

class FetchingTrendingTvShowListWeekly extends TrendingTvShowWeeklyEvent {}
