import 'package:cocktailr/src/ui/ui.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';

import '../../domain/models/cocktail.dart';
import '../../domain/models/ingredient.dart';

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
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const AppBackButton(),
        title: Text(
          cocktail?.name ?? cocktailId.toString(),
          style: typography.title2.copyWith(color: colors.white),
        ),
      ),
      backgroundColor: colors.royal200,
      extendBodyBehindAppBar: true,
      body: _Body(cocktail: cocktail),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    this.cocktail,
  });

  final Cocktail? cocktail;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _CocktailImage(cocktail: cocktail),
              const SizedBox(height: 48.0),
              _IngredientsSection(ingredients: cocktail?.ingredients ?? []),
              const SizedBox(height: 56.0),
              _AboutSection(text: cocktail?.history ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}

class _CocktailImage extends StatelessWidget {
  const _CocktailImage({
    this.cocktail,
  });

  final Cocktail? cocktail;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: NetworkImageAsset(
        imageUrl: cocktail?.imageUri ?? '',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16.0),
        const Expanded(child: _GoldenTrim()),
        const SizedBox(width: 16.0),
        Text(
          title.toUpperCase(),
          style: context.appTypography.title4.copyWith(color: context.appColors.white),
        ),
        const SizedBox(width: 16.0),
        const Expanded(child: _GoldenTrim()),
        const SizedBox(width: 16.0),
      ],
    );
  }
}

class _GoldenTrim extends StatelessWidget {
  const _GoldenTrim();

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

class _IngredientsSection extends StatelessWidget {
  const _IngredientsSection({
    required this.ingredients,
  });

  final List<Ingredient> ingredients;

  @override
  Widget build(BuildContext context) {
    final listItems = ingredients
        .map<Widget>((ingredient) => _IngredientListItem(ingredient: ingredient))
        .intersperseOuter(const _IngredientListBorder())
        .toList();

    if (listItems.isEmpty) {
      return const SizedBox.shrink();
    }

    listItems.removeAt(0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(title: 'Ingredients'),
          const SizedBox(height: 24.0),
          ...listItems,
        ],
      ),
    );
  }
}

class _IngredientListItem extends StatelessWidget {
  const _IngredientListItem({
    required this.ingredient,
  });

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    final text = [
      ingredient.quantity?.toString(),
      ingredient.unit?.name,
      ingredient.name,
    ].whereNotNull().join(' ');

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 16.0,
      ),
      child: Text(
        text,
        style: context.appTypography.ingredientItem.copyWith(color: context.appColors.white),
      ),
    );
  }
}

class _IngredientListBorder extends StatelessWidget {
  const _IngredientListBorder();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 1.5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.appColors.royal100,
        ),
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(title: 'About'),
          const SizedBox(height: 24.0),
          Text(
            text,
            style: context.appTypography.paragraph.copyWith(color: context.appColors.white),
          ),
        ],
      ),
    );
  }
}
