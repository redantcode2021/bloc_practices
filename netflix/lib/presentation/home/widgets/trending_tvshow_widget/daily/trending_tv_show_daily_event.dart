part of 'trending_tv_show_daily_bloc.dart';

abstract class TrendingTvShowDailyEvent extends Equatable {
  const TrendingTvShowDailyEvent();

  @override
  List<Object> get props => [];
}

class FetchingTrendingTvShowListDaily extends TrendingTvShowDailyEvent {}
