// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'app_colors.tailor.dart';

@TailorMixin()
class AppColors extends ThemeExtension<AppColors> with _$AppColorsTailorMixin {
  const AppColors({
    required this.white,
    required this.royal100,
    required this.royal200,
    required this.royal300,
    required this.gold,
  });

  final Color white;
  final Color royal100;
  final Color royal200;
  final Color royal300;
  final Color gold;
}
