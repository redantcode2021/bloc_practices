part of 'trending_tv_show_bloc.dart';

abstract class TrendingTvShowState extends Equatable {
  const TrendingTvShowState();

  @override
  List<Object> get props => [];
}

class TrendingTvShowInitial extends TrendingTvShowState {}

class TrendingTvShowListWeekly extends TrendingTvShowState {
  final List<Movie> list;
  const TrendingTvShowListWeekly({
    required this.list,
  });
}

class TrendingTvShowListDaily extends TrendingTvShowState {
  final List<Movie> list;
  const TrendingTvShowListDaily({
    required this.list,
  });
}
