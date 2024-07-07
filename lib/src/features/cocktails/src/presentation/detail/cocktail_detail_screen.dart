import 'package:cocktailr/src/ui/ui.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intersperse/intersperse.dart';

import '../../application/providers.dart';
import '../../domain/models/cocktail.dart';
import '../../domain/models/ingredient.dart';

class CocktailDetailScreen extends ConsumerWidget {
  const CocktailDetailScreen({
    super.key,
    required this.cocktailId,
    this.cocktail,
  });

  final int cocktailId;
  final Cocktail? cocktail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (cocktail != null) {
      return _DataScaffold(cocktail: cocktail!);
    }

    final cocktailFuture = ref.watch(cocktailProvider(cocktailId));

    return cocktailFuture.when(
      data: (cocktail) => _DataScaffold(cocktail: cocktail),
      loading: () => const Scaffold(
        appBar: _AppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, _) => Scaffold(
        appBar: const _AppBar(),
        body: Center(
          child: Text(
            error.toString(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _DataScaffold extends StatelessWidget {
  const _DataScaffold({
    required this.cocktail,
  });

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Scaffold(
      appBar: _AppBar(title: cocktail.name),
      backgroundColor: colors.royal200,
      extendBodyBehindAppBar: true,
      body: _Body(cocktail: cocktail),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final typography = context.appTypography;

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: const AppBackButton(),
      title: Text(
        title ?? '',
        style: typography.title2.copyWith(color: colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
        const Expanded(child: GoldenTrim()),
        const SizedBox(width: 16.0),
        Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'Ingredients'.toUpperCase(),
              style: context.appTypography.title4.copyWith(color: Colors.transparent),
            ),
            Text(
              title.toUpperCase(),
              style: context.appTypography.title4.copyWith(color: context.appColors.white),
            ),
          ],
        ),
        const SizedBox(width: 16.0),
        const Expanded(child: GoldenTrim()),
        const SizedBox(width: 16.0),
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
        .intersperseOuter(const ListItemDivider())
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
