import 'package:flutter/material.dart';

import '../data/mock_articles.dart';
import '../widgets/article_grid.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  String _selected = 'All';

  @override
  Widget build(BuildContext context) {
    final filtered = _selected == 'All'
        ? mockArticles
        : mockArticles.where((a) => a.category == _selected).toList();

    return Column(children: [
      SizedBox(
        height: 56,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          children: [
            for (final c in ['All', ...categories])
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(c),
                  selected: _selected == c,
                  onSelected: (_) => setState(() => _selected = c),
                ),
              ),
          ],
        ),
      ),
      Expanded(
        child: filtered.isEmpty
            ? const Center(child: Text('No articles in this category yet.'))
            : ArticleGrid(
                key: ValueKey(_selected),
                articles: filtered,
                heroScope: 'cat',
              ),
      ),
    ]);
  }
}
