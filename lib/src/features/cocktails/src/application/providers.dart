import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/cocktail_repository.dart';

final cocktailsProvider = FutureProvider.autoDispose((ref) async {
  return await ref.watch(cocktailRepositoryProvider).getCocktails();
});
