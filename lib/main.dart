import 'package:cocktailr/src/routing/routing.dart';
import 'package:cocktailr/src/ui/ui.dart';
import 'package:cocktailr/src/utils/utils.dart' show talkerInstance;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

void main() {
  EquatableConfig.stringify = true;

  runApp(
    ProviderScope(
      observers: [
        TalkerRiverpodObserver(
          talker: talkerInstance,
          settings: const TalkerRiverpodLoggerSettings(
            printStateFullData: false,
          ),
        ),
      ],
      child: const CocktailrApp(),
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
      theme: darkTheme,
    );
  }
}
