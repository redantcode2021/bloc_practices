import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rawg/common/widgets/error_widget.dart';
import 'package:flutter_rawg/presentation/home/widgets/games_by_category_widget/games_by_category_barrel.dart';

class GamesByCategoryWidget extends StatelessWidget {
  const GamesByCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesByCategoryBloc, GamesByCategoryState>(
        builder: ((context, state) {
      return state.status.isSuccess
          ? GameByCategorySuccessWidget(
              categoryName: state.categoryName,
              games: state.games,
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
