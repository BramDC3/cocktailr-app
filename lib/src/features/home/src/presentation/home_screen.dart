import 'package:cocktailr/src/routing/routing.dart';
import 'package:cocktailr/src/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: SvgAsset(assetName: 'assets/icons/ic_cocktail_inactive.svg'),
              activeIcon: SvgAsset(assetName: 'assets/icons/ic_cocktail_active.svg'),
              label: 'Cocktails',
              tooltip: 'Show cocktails'),
          BottomNavigationBarItem(
              icon: SvgAsset(assetName: 'assets/icons/ic_bartender_inactive.svg'),
              activeIcon: SvgAsset(assetName: 'assets/icons/ic_bartender_active.svg'),
              label: 'Bartender',
              tooltip: 'Show bartender'),
        ],
        backgroundColor: colors.royal100,
        selectedLabelStyle: context.bottomNavBar,
        unselectedLabelStyle: context.bottomNavBar,
        selectedItemColor: colors.gold,
        unselectedItemColor: colors.bottomNavBarInactive,
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    if (location.startsWith(AppRoutes.getAssistantUrl())) {
      return 1;
    }

    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    final location = switch (index) {
      1 => AppRoutes.getAssistantUrl(),
      0 || _ => AppRoutes.getCocktailsUrl(),
    };

    context.go(location);
  }
}
