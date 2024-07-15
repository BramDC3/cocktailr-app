import 'package:flutter/material.dart';

class GeneralErrorState extends StatelessWidget {
  const GeneralErrorState({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Something went wrong. Please try again.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
