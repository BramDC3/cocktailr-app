import 'package:cocktailr/src/features/assistant/assistant.dart';
import 'package:cocktailr/src/features/cocktails/cocktails.dart';
import 'package:cocktailr/src/features/home/home.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final _cocktailDetailRoute = GoRoute(
  path: ':id',
  parentNavigatorKey: _rootNavigatorKey,
  builder: (context, state) {
    // TODO: error handling for invalid ids
    final id = int.parse(state.pathParameters['id']!);
    final cocktail = state.extra as Cocktail?;

    return CocktailDetailScreen(
      cocktailId: id,
      cocktail: cocktail,
    );
  },
);

final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/${AppRouteNames.cocktails}',
  observers: [
    SentryNavigatorObserver(),
  ],
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => HomeScreen(child: child),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/${AppRouteNames.cocktails}',
              builder: (context, state) => const CocktailsOverviewScreen(),
              routes: [
                GoRoute(
                  path: AppRouteNames.cocktailSearch,
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const SearchCocktailScreen(),
                  routes: [
                    _cocktailDetailRoute,
                  ],
                ),
                _cocktailDetailRoute,
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/${AppRouteNames.assistant}',
              builder: (context, state) => const AssistantScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

final goRouterProvider = Provider<GoRouter>((ref) {
  return _router;
});
