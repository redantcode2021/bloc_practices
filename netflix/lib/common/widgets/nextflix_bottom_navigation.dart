import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:netflix/utils/utils.dart';

class NetflixBottomNavigation extends StatefulWidget {
  const NetflixBottomNavigation({Key? key}) : super(key: key);

  @override
  State<NetflixBottomNavigation> createState() =>
      _NetflixBottomNavigationState();
}

class _NetflixBottomNavigationState extends State<NetflixBottomNavigation> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: bottomNavigationBarColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.home),
          activeIcon: Icon(LucideIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.gamepad2),
          activeIcon: Icon(LucideIcons.gamepad2),
          label: 'Games',
        ),
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.youtube),
          activeIcon: Icon(LucideIcons.youtube),
          label: 'New & Hot',
        ),
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.smile),
          activeIcon: Icon(LucideIcons.smile),
          label: 'Fast Laughs',
        ),
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.download),
          activeIcon: Icon(LucideIcons.download),
          label: 'Downloads',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _index,
      selectedItemColor: Colors.white,
      onTap: (value) {
        switch (value) {
          case 0:
            context.go('/home');
            break;
          case 2:
            context.go('/newandhot');
            break;
          default:
        }
        setState(() {
          _index = value;
        });
      },
    );
  }
}
