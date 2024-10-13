import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/app_colours.dart';

class ThumbnailImage extends StatelessWidget {
  final String uri;
  final String label;
  final double width;
  const ThumbnailImage({
    super.key,
    required this.uri,
    required this.label,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColours.background,
            borderRadius: BorderRadius.circular(16)),
        child: Semantics(
            label: label,
            child: CachedNetworkImage(
              imageUrl: uri,
              width: width,
            )));
  }
}
