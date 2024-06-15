import 'package:cocktailr/src/ui/ui.dart';
import 'package:flutter/material.dart';

import '../../domain/models/cocktail.dart';

class CocktailDetailScreen extends StatelessWidget {
  const CocktailDetailScreen({
    super.key,
    required this.cocktailId,
    this.cocktail,
  });

  final int cocktailId;
  final Cocktail? cocktail;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(
          cocktail?.name ?? cocktailId.toString(),
          style: typography.title2.copyWith(color: colors.white),
        ),
        backgroundColor: colors.royal200,
      ),
      backgroundColor: colors.royal200,
    );
  }
}
