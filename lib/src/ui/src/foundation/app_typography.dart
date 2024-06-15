// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_typography.tailor.dart';

@TailorMixin()
class AppTypography extends ThemeExtension<AppTypography> with _$AppTypographyTailorMixin {
  const AppTypography({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.ingredientItem,
    required this.paragraph,
  });

  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;
  final TextStyle title4;
  final TextStyle ingredientItem;
  final TextStyle paragraph;
}
