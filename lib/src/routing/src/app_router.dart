import 'package:cocktailr/src/features/cocktails/cocktails.dart';
import 'package:cocktailr/src/features/profile/profile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';
import 'widgets/scaffold_with_bottom_nav_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

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
              name: 'cocktails',
              path: AppRoutes.cocktails,
              builder: (context, state) => const CocktailsOverviewScreen(),
              routes: const [],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: 'profile',
              path: AppRoutes.profile,
              builder: (context, state) => const ProfileScreen(),
              routes: const [],
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
