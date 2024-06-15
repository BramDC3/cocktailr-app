// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_gradients.tailor.dart';

@TailorMixin()
class AppGradients extends ThemeExtension<AppGradients> with _$AppGradientsTailorMixin {
  const AppGradients({
    required this.gold,
  });

  final LinearGradient gold;
}
