part of 'trending_tv_show_bloc.dart';

abstract class TrendingTvShowEvent extends Equatable {
  const TrendingTvShowEvent();

  @override
  List<Object> get props => [];
}

class FetchTrendingTvShowListWeekly extends TrendingTvShowEvent {}

class FetchTrendingTvShowListDaily extends TrendingTvShowEvent {}
