import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_barrel.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
        buildWhen: (previous, current) => current.status.isSuccess,
        builder: (context, state) {
          return const CategoriesSuccessWidget();
        });
  }
}
