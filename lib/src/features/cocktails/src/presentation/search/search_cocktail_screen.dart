import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktailr/src/routing/routing.dart';
import 'package:cocktailr/src/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/cocktail.dart';
import 'controllers/filtered_cocktails_provider.dart';

class SearchCocktailScreen extends StatelessWidget {
  const SearchCocktailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.royal200,
      body: const Column(
        children: [
          SafeArea(
            bottom: false,
            child: _Header(),
          ),
          SizedBox(height: 32.0),
          Expanded(
            child: SafeArea(
              top: false,
              child: _CocktailList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 32.0,
        top: 16.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                ref.read(filteredCocktailsProvider.notifier).onNameFilterUpdated(value);
              },
              style: context.title3.copyWith(color: context.white),
              decoration: InputDecoration(
                hintText: 'Start typing...',
                hintStyle: context.title3.copyWith(color: context.white),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          AppIconButton(
            assetName: 'assets/icons/ic_close.svg',
            tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go(AppRoutes.getCocktailsUrl());
              }
            },
          ),
        ],
      ),
    );
  }
}

class _CocktailList extends ConsumerWidget {
  const _CocktailList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredCocktails = ref.watch(filteredCocktailsProvider);

    return filteredCocktails.when(
      data: (cocktails) {
        if (cocktails.isEmpty) {
          return const Center(
            child: Text('No cocktails'),
          );
        }

        return ListView.separated(
          itemCount: cocktails.length,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemBuilder: (context, index) {
            final cocktail = cocktails[index];
            return _CocktailCard(cocktail: cocktail);
          },
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ListItemDivider(),
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, _) => Center(
        child: Text(
          error.toString(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _CocktailCard extends StatelessWidget {
  const _CocktailCard({
    required this.cocktail,
  });

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(
          AppRoutes.getCocktailSearchDetailUrl(cocktail.id),
          extra: cocktail,
        );
      },
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: cocktail.imageUri,
              width: 72.0,
              height: 72.0,
            ),
            const SizedBox(width: 40.0),
            Expanded(
              child: Text(
                cocktail.name,
                style: context.title3.copyWith(color: context.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
