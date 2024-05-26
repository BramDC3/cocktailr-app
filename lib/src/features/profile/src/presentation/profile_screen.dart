import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text('Profile'),
              const SizedBox(height: 30),
              const Text('Greetings fellow bartender.\nAuthenticate yourself to unlock this apps full potential'),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Authenticate with Okta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
