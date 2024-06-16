import 'package:cocktailr/src/features/cocktails/cocktails.dart';
import 'package:cocktailr/src/features/profile/profile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';
import 'widgets/scaffold_with_bottom_nav_bar.dart';

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
  initialLocation: AppRoutes.cocktails,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => ScaffoldWithBottomNavBar(child: child),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.cocktails,
              builder: (context, state) => const CocktailsOverviewScreen(),
              routes: [
                GoRoute(
                  path: AppRoutes.search,
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
              path: AppRoutes.profile,
              builder: (context, state) => const ProfileScreen(),
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
