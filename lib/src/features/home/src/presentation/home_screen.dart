import 'package:cocktailr/src/routing/routing.dart';
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
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.tour),
            label: 'Cocktails',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    if (location.startsWith(AppRoutes.profile)) {
      return 1;
    }

    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    final location = switch (index) {
      1 => AppRoutes.profile,
      0 || _ => AppRoutes.cocktails,
    };

    GoRouter.of(context).go(location);
  }
}
