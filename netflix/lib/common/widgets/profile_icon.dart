import 'package:flutter/material.dart';
import 'package:netflix/presentation/profile/pages/profile_selection_screen.dart';

class ProfileIcon extends StatelessWidget {
  final double? iconSize;
  final Color color;
  const ProfileIcon({
    Key? key,
    this.iconSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: iconSize,
          height: iconSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(iconSize == null ? 6 : 4)),
        ),
        iconSize != null
            ? CustomPaint(
                painter: Smile(),
                size: Size(iconSize!, iconSize!),
              )
            : CustomPaint(
                painter: Smile(),
                child: Container(),
              )
      ],
    );
  }
}
