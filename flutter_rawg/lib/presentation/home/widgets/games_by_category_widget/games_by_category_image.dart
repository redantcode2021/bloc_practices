import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'games_by_category_barrel.dart';

class GamesByCategoryImage extends StatelessWidget {
  const GamesByCategoryImage({
    Key? key,
    required this.name,
    required this.backgroundImage,
  }) : super(key: key);

  final String name;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: backgroundImage,
      imageBuilder: (context, imageProvider) => Stack(
        children: [
          Container(
            width: 270.0,
            height: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.black45,
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 18.0,
            child: GamesByCategoryTitle(
              name: name,
            ),
          ),
        ],
      ),
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.deepOrangeAccent,
      ),
    );
  }
}
