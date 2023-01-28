import 'package:flutter/material.dart';
import 'package:flutter_rawg/presentation/home/pages/home_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: HomeLayout(),
    );
  }
}
