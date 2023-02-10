import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:netflix/common/widgets/profile_icon.dart';
import 'package:netflix/cubit/animation_status_cubit.dart';
import 'package:netflix/presentation/profile/bloc/profile_bloc.dart';
import 'package:netflix/utils/utils.dart';

class NetflixHeader extends SliverPersistentHeaderDelegate {
  final double scrollOffset;
  final String? name;
  NetflixHeader({
    required this.scrollOffset,
    this.name,
  });
  final Duration _duration = const Duration(microseconds: 150);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final status = context.watch<AnimationStatusCubit>();
    final opacity = status.state == AnimationStatus.forward ? 0.0 : 1.0;
    final backButtonOpacity =
        status.state != AnimationStatus.reverse ? 1.0 : 0.0;
    final canPop = GoRouter.of(context).canPop();
    return Container(
      color: Colors.black
          .withOpacity((scrollOffset / 350).clamp(0, .8).toDouble()),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          canPop
              ? Row(
                  children: [
                    AnimatedOpacity(
                      opacity: backButtonOpacity,
                      duration: _duration,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(LucideIcons.arrowLeft)),
                    ),
                    Text(
                      name ?? '',
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                )
              : AnimatedOpacity(
                  opacity: opacity,
                  duration: _duration,
                  child: Image.asset(
                    'assets/netflix_symbol.png',
                  ),
                ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(LucideIcons.cast)),
              IconButton(
                  onPressed: () {}, icon: const Icon(LucideIcons.search)),
              IconButton(
                  onPressed: () => context.go('/profile'),
                  icon: Builder(builder: (context) {
                    final state = context.read<ProfileBloc>().state;
                    return ProfileIcon(
                      color: profileColors[state.profile],
                      iconSize: IconTheme.of(context).size,
                    );
                  })),
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 64.0;

  @override
  double get minExtent => 64.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
