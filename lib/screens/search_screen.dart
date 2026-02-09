import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 80, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          Text('Search', style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    );
  }
}
