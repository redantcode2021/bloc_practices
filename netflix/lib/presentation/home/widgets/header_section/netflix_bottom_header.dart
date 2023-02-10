import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:netflix/cubit/animation_status_cubit.dart';
import 'package:go_router/go_router.dart';

class NetflixBottomHeader extends SliverPersistentHeaderDelegate {
  final double scrollOffset;
  NetflixBottomHeader({
    required this.scrollOffset,
  });

  final Duration _duration = const Duration(microseconds: 150);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BlocBuilder<AnimationStatusCubit, AnimationStatus?>(
        buildWhen: ((previous, current) {
      return previous != current;
    }), builder: (context, status) {
      final location = GoRouter.of(context).location;
      final isTvShowsPage = location == '/home/tvshows';
      final opacity = isTvShowsPage
          ? (status == AnimationStatus.completed ? 1.0 : 0.0)
          : (status == AnimationStatus.forward ? 0.0 : 1.0);

      return Container(
        color: Colors.black
            .withOpacity((scrollOffset / 350).clamp(0, .8).toDouble()),
        child: Row(
          mainAxisAlignment: isTvShowsPage
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: 'tvshows2',
              child: FittedBox(
                child: TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  onPressed: () {
                    context.goNamed('TV Shows');
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'TV Shows',
                        style: isTvShowsPage
                            ? const TextStyle(fontSize: 22.0)
                            : const TextStyle(fontSize: 18.0),
                      ),
                      if (isTvShowsPage) ...[
                        const SizedBox(
                          width: 8.0,
                        ),
                        AnimatedOpacity(
                          opacity: opacity,
                          duration: _duration,
                          child: const Icon(
                            LucideIcons.chevronDown,
                            size: 16.0,
                          ),
                        )
                      ]
                    ],
                  ),
                ),
              ),
            ),
            if (!isTvShowsPage)
              Opacity(
                opacity: opacity,
                child: TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  onPressed: () {},
                  child: const Text(
                    'Movies',
                    style: TextStyle(fontSize: 19.0),
                  ),
                ),
              ),
            Opacity(
              opacity: opacity,
              child: TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                onPressed: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${isTvShowsPage && opacity == 1.0 ? 'All' : ''}Categories',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const Icon(
                      LucideIcons.chevronDown,
                      size: 16.0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  double get maxExtent => 48.0;

  @override
  double get minExtent => 48.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
