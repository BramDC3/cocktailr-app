import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

import '../../foundation/app_colors.dart';
import '../svg_asset.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.assetName,
    this.onPressed,
    this.tooltip,
  });

  final String assetName;
  final VoidCallback? onPressed;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    const containerRotationInDegrees = 45.0;

    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onPressed,
        child: Transform.rotate(
          angle: radians(containerRotationInDegrees),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.white.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.royal300,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Transform.rotate(
                    angle: radians(-containerRotationInDegrees),
                    child: SvgAsset(assetName: assetName),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
