import 'package:cocktailr/src/monitoring/monitoring.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/cocktail_repository.dart';

final cocktailsProvider = FutureProvider.autoDispose((ref) async {
  final crashReportingService = ref.watch(crashReportingServiceProvider);

  try {
    return await ref.watch(cocktailRepositoryProvider).getCocktails();
  } catch (e, st) {
    crashReportingService.reportNonFatalError(e, st);
    rethrow;
  }
});

final cocktailProvider = FutureProvider.family.autoDispose((ref, int id) async {
  final crashReportingService = ref.watch(crashReportingServiceProvider);

  try {
    return await ref.watch(cocktailRepositoryProvider).getCocktail(id);
  } catch (e, st) {
    crashReportingService.reportNonFatalError(e, st);
    rethrow;
  }
});
