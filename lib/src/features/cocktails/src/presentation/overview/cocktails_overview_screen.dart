import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers.dart';
import '../../domain/models/cocktail.dart';

class CocktailsOverviewScreen extends StatelessWidget {
  const CocktailsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [
          _Header(),
          _CocktailCarousel(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'Cocktails',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text('Bartenders\nFriend'),
        ),
        const SizedBox(width: 16.0),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}

class _CocktailCarousel extends ConsumerWidget {
  const _CocktailCarousel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cocktails = ref.watch(cocktailsProvider);

    return cocktails.when(
      data: (cocktails) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cocktails.length,
          itemBuilder: (context, index) {
            final cocktail = cocktails[index];

            return _CocktailCard(cocktail: cocktail);
          },
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => Text(error.toString()),
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
    return Card(
      child: Column(
        children: [
          Image.network(cocktail.imageUri),
          Text(cocktail.name),
        ],
      ),
    );
  }
}
