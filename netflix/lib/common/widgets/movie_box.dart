import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/bloc/configuration/configuration_bloc.dart';
import 'package:netflix/common/widgets/netflix_bottom_sheet.dart';
import 'package:netflix/common/widgets/poster_image.dart';
import 'package:netflix/utils/utils.dart';

import '../../model/model_barrel.dart';

class MovieBox extends StatelessWidget {
  const MovieBox({
    Key? key,
    required this.movie,
    this.laughs,
    this.fill = false,
    this.padding,
  }) : super(key: key);

  final Movie movie;
  final int? laughs;
  final bool fill;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final configuration = context.watch<ConfigurationBloc>().state;
    final imageAvailable = movie.posterPath != null;
    final thumbnailProvider = (imageAvailable
        ? CachedNetworkImageProvider(
            '${configuration.data?.images.baseUrl}/${configuration.data?.images.posterSizes[1]}${movie.posterPath}')
        : const AssetImage(
            'assets/netflix_symbol.png',
          )) as ImageProvider;

    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            backgroundColor: bottomSheetColor,
            builder: (context) {
              return NetflixBottomSheet(
                thumbnail: thumbnailProvider,
                movie: movie,
              );
            },
          );
        },
        child: Stack(
          children: [
            fill
                ? Positioned.fill(
                    child:
                        PosterImage(movie: movie, width: 110.0, height: 220.0))
                : PosterImage(movie: movie, width: 110.0, height: 220.0),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/netflix_symbol.png',
                width: 24.0,
              ),
            ),
            if (laughs != null)
              Positioned(
                bottom: 2.0,
                left: 4.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('\u{1F602}'),
                    Text(
                      '${laughs}K',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
