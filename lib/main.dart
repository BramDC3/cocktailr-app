import 'package:cocktailr/src/features/cocktails/cocktails.dart';
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

class CocktailrApp extends StatelessWidget {
  const CocktailrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CocktailsOverviewScreen(),
    );
  }
}
