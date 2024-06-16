import 'package:cocktailr/src/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/cocktail.dart';
import 'controllers/filtered_cocktails_provider.dart';

class SearchCocktailScreen extends StatelessWidget {
  const SearchCocktailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: _Header(),
          ),
          Expanded(
            child: _CocktailList(),
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
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (value) {
              ref.read(filteredCocktailsProvider.notifier).onNameFilterUpdated(value);
            },
            decoration: const InputDecoration(
              hintText: 'Start typing...',
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        IconButton(
          onPressed: () {
            final goRouter = GoRouter.of(context);
            if (goRouter.canPop()) {
              goRouter.pop();
            } else {
              goRouter.go(AppRoutes.cocktails);
            }
          },
          icon: const Icon(Icons.close),
        ),
      ],
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

        return ListView.builder(
          itemCount: cocktails.length,
          itemBuilder: (context, index) {
            final cocktail = cocktails[index];
            return _CocktailCard(cocktail: cocktail);
          },
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
        GoRouter.of(context).go(
          '/cocktails/search/${cocktail.id}',
          extra: cocktail,
        );
      },
      child: ListTile(
        title: Text(cocktail.name),
      ),
    );
  }
}
