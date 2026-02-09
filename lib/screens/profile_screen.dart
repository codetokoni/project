import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 80, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    );
  }
}
