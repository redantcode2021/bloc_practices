import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rawg/common/widgets/error_widget.dart';
import 'package:flutter_rawg/presentation/home/widgets/all_games_widget/all_games_barrel.dart';
import 'package:flutter_rawg/presentation/home/widgets/all_games_widget/all_games_success_widget.dart';

class AllGamesWidget extends StatelessWidget {
  const AllGamesWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllGamesBloc, AllGamesState>(builder: ((context, state) {
      return state.status.isSuccess
          ? AllGamesSuccessWidget(
              games: state.games.results,
              title: title,
            )
          : state.status.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state.status.isError
                  ? const ErrorGameWidget()
                  : const SizedBox();
    }));
  }
}
