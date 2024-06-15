import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class SvgAsset extends StatelessWidget {
  const SvgAsset({
    super.key,
    required this.assetName,
  });

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return VectorGraphic(
      loader: AssetBytesLoader(assetName),
    );
  }
}
