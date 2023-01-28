import 'package:flutter/material.dart';
import 'package:flutter_rawg/common/widgets/container_body.dart';
import 'package:flutter_rawg/presentation/home/widgets/category_widget/category_widget.dart';
import 'package:flutter_rawg/presentation/home/widgets/header_title/header_title.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 80.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HeaderTitle(),
          SizedBox(height: 40),
          ContainerBody(
            children: [
              CategoriesWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
