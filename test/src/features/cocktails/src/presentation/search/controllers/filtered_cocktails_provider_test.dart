import 'package:cocktailr/src/features/cocktails/cocktails.dart';
import 'package:cocktailr/src/features/cocktails/src/application/providers.dart';
import 'package:cocktailr/src/features/cocktails/src/presentation/search/controllers/filtered_cocktails_provider.dart';
import 'package:cocktailr/src/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../../mocks/mocks.dart';

void main() {
  const cocktailBramble = Cocktail(
    id: 2,
    name: 'Bramble',
    recipe: 'recipe',
    imageUri: 'imageUri',
    history: 'history',
    ingredients: [],
  );

  const cocktails = [
    Cocktail(
      id: 1,
      name: "Dark 'n Stormy",
      recipe: 'recipe',
      imageUri: 'imageUri',
      history: 'history',
      ingredients: [],
    ),
    cocktailBramble,
    Cocktail(
      id: 3,
      name: 'Moscow Mule',
      recipe: 'recipe',
      imageUri: 'imageUri',
      history: 'history',
      ingredients: [],
    ),
  ];

  ProviderContainer createContainer() {
    final container = ProviderContainer(
      overrides: [
        cocktailsProvider.overrideWith((ref) => cocktails),
        loggerProvider.overrideWith((ref) => MockLogger()),
      ],
    );

    addTearDown(container.dispose);

    return container;
  }

  group('Given that no name filter is set', () {
    group('when the filtered cocktails are fetched', () {
      test('then the cocktails are returned unfiltered', () async {
        final container = createContainer();

        await expectLater(
          container.read(filteredCocktailsProvider.future),
          completion(cocktails),
        );
      });
    });
  });

  group('Given that a name filter is set', () {
    group('when the filtered cocktails are fetched', () {
      test('then the filtered cocktails are returned', () async {
        final container = createContainer();
        final provider = container.read(filteredCocktailsProvider.notifier);

        provider.onNameFilterUpdated('bram');

        await expectLater(
          container.read(filteredCocktailsProvider.future),
          completion([cocktailBramble]),
        );
      });
    });
  });
}
