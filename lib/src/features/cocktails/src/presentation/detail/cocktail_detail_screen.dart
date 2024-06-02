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
    return Scaffold(
      appBar: AppBar(
        title: Text(cocktail?.name ?? cocktailId.toString()),
      ),
    );
  }
}
