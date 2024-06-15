import 'package:flutter/material.dart';

import '../foundation/app_colors.dart';
import '../foundation/app_gradients.dart';
import '../foundation/app_typography.dart';
import '../primitives/color_tokens.dart';
import '../primitives/gradient_tokens.dart';
import '../primitives/typography_tokens.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  extensions: const [
    AppColors(
      white: ColorTokens.white,
      royal100: ColorTokens.royal100,
      royal200: ColorTokens.royal200,
      royal300: ColorTokens.royal300,
      gold: ColorTokens.gold,
    ),
    AppGradients(
      gold: GradientTokens.gold,
    ),
    AppTypography(
      title1: TypographyTokens.title1,
      title2: TypographyTokens.title2,
      title3: TypographyTokens.title3,
      title4: TypographyTokens.title4,
      ingredientItem: TypographyTokens.ingredientItem,
      paragraph: TypographyTokens.paragraph,
    ),
  ],
);
