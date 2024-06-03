import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/providers.dart';
import '../../../domain/models/cocktail.dart';

class FilteredCocktailsProvider extends AutoDisposeAsyncNotifier<List<Cocktail>> {
  @override
  FutureOr<List<Cocktail>> build() async {
    final cocktails = ref.read(cocktailsProvider);
    return cocktails.asData?.value ?? [];
  }

  Future<void> onNameFilterUpdated(String name) async {
    final cocktails = ref.read(cocktailsProvider);

    state = cocktails.when(
      data: (cocktails) => AsyncData(_filterCocktails(name, cocktails)),
      error: (e, st) => AsyncError(e, st),
      loading: () => const AsyncLoading(),
    );
  }

  List<Cocktail> _filterCocktails(String name, List<Cocktail> cocktails) {
    if (name.isEmpty) {
      return cocktails;
    }

    return cocktails.where((cocktail) {
      return cocktail.name.toLowerCase().contains(name.toLowerCase());
    }).toList();
  }
}

final filteredCocktailsProvider =
    AsyncNotifierProvider.autoDispose<FilteredCocktailsProvider, List<Cocktail>>(FilteredCocktailsProvider.new);
