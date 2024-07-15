import 'dart:async';

import 'package:cocktailr/src/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/providers.dart';
import '../../../domain/models/cocktail.dart';

class FilteredCocktailsProvider extends AutoDisposeAsyncNotifier<List<Cocktail>> {
  static const _tag = 'FilteredCocktailsProvider';

  String _nameFilter = '';

  @override
  FutureOr<List<Cocktail>> build() async {
    final cocktails = await ref.watch(cocktailsProvider.future);
    return _filterCocktails(cocktails);
  }

  Future<void> onNameFilterUpdated(String name) async {
    _logger.info(_tag, 'onNameFilterUpdated(name: $name)');

    _nameFilter = name;

    if (state is! AsyncData) {
      return;
    }

    final cocktails = ref.read(cocktailsProvider);

    state = cocktails.when(
      data: (cocktails) => AsyncData(_filterCocktails(cocktails)),
      error: (e, st) => AsyncError(e, st),
      loading: () => const AsyncLoading(),
    );
  }

  List<Cocktail> _filterCocktails(List<Cocktail> cocktails) {
    if (_nameFilter.isEmpty) {
      return cocktails;
    }

    return cocktails.where((cocktail) {
      return cocktail.name.toLowerCase().contains(_nameFilter.toLowerCase());
    }).toList();
  }

  void onTryAgainPressed() {
    _logger.info(_tag, 'onTryAgainPressed()');

    ref.invalidate(cocktailsProvider);
  }

  Logger get _logger => ref.read(loggerProvider);
}

final filteredCocktailsProvider =
    AsyncNotifierProvider.autoDispose<FilteredCocktailsProvider, List<Cocktail>>(FilteredCocktailsProvider.new);
