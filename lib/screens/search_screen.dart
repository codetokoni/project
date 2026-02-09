import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = '';

  static const _categories = [
    'Featured',
    'FALF Impact News',
    'Round Table',
    'My FALA Experience',
    'Spotlight',
    'Leadership Gems',
  ];

  static const _documentaries = [
    'The Global Toilet Misdesign',
    'War on Health',
    'The Cholesterol Fraud',
    'The War on Plastics',
    'Drugs of Doom',
    'The Invisible Menace',
    'Indoctrinating Generations',
    'Cancer Fraud',
    'Sound Trap',
    'The Blood Pressure Fraud',
    'Philanthrocapitalism: The Illusion of Help',
    'Vitamin Fraud',
    'The Deception of Convenience',
    'Food Deception',
    'Where Are the Children',
    'The Truth About Vaccines',
    'Big Pharma & The Fake News Media',
    'The Failed Script',
    'The Pandemic of the Vaccinated',
    'The False Solutions',
    'Mosquito Mayhem',
    'Where Do Viruses Come From',
  ];

  List<String> get _filteredDocs {
    if (_query.isEmpty) return _documentaries;
    final lower = _query.toLowerCase();
    return _documentaries
        .where((d) => d.toLowerCase().contains(lower))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        TextField(
          onChanged: (value) => setState(() => _query = value),
          decoration: InputDecoration(
            hintText: 'Search documentaries...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Categories',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _categories
              .map(
                (cat) => ActionChip(
                  label: Text(cat),
                  avatar: Icon(Icons.category, size: 16, color: colorScheme.primary),
                  onPressed: () {},
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 24),
        Text(
          'Documentaries',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ..._filteredDocs.map(
          (doc) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: colorScheme.primaryContainer,
                child: Icon(Icons.movie, color: colorScheme.onPrimaryContainer),
              ),
              title: Text(doc),
              trailing: const Icon(Icons.play_circle_outline),
              onTap: () {},
            ),
          ),
        ),
        if (_filteredDocs.isEmpty)
          const Padding(
            padding: EdgeInsets.only(top: 32),
            child: Center(
              child: Text('No documentaries found.'),
            ),
          ),
      ],
    );
  }
}
