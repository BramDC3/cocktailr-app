import 'package:cocktailr/src/routing/routing.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  EquatableConfig.stringify = true;

  runApp(
    const ProviderScope(
      child: CocktailrApp(),
    ),
  );
}

class CocktailrApp extends ConsumerWidget {
  const CocktailrApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Cocktailr',
      routerConfig: goRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
