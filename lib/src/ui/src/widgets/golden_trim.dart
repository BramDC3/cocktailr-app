import 'package:flutter/material.dart';

import '../foundation/app_colors.dart';
import '../foundation/app_gradients.dart';

class GoldenTrim extends StatelessWidget {
  const GoldenTrim({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          height: 1.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: context.appColors.gold),
          ),
        ),
        const SizedBox(height: 6.0),
        SizedBox(
          width: double.infinity,
          height: 3.0,
          child: DecoratedBox(
            decoration: BoxDecoration(gradient: context.appGradients.gold),
          ),
        ),
      ],
    );
  }
}
