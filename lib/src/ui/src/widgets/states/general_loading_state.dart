import 'package:flutter/material.dart';

class GeneralLoadingState extends StatelessWidget {
  const GeneralLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
