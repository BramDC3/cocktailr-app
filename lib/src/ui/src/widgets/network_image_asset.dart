import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageAsset extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;

  const NetworkImageAsset({
    super.key,
    required this.imageUrl,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
    );
  }
}
