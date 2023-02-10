import 'package:flutter/material.dart';
import 'package:netflix/common/widgets/nextflix_bottom_navigation.dart';

class NetflixScaffold extends StatelessWidget {
  const NetflixScaffold({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: child,
      bottomNavigationBar: const NetflixBottomNavigation(),
    ));
  }
}
