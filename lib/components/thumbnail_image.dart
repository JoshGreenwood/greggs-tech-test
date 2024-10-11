import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/app_colours.dart';

class ThumbnailImage extends StatelessWidget {
  final String uri;
  final String label;

  const ThumbnailImage({
    super.key,
    required this.uri,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        decoration: BoxDecoration(
            color: AppColours.background,
            borderRadius: BorderRadius.circular(16)),
        child: Semantics(
            label: label,
            child: CachedNetworkImage(
              imageUrl: uri,
              width: 100,
            )));
  }
}
