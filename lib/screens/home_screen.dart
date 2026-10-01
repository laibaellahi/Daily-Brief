import 'package:flutter/material.dart';

import '../data/mock_articles.dart';
import '../widgets/article_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Top Stories',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
      ),
      Expanded(child: ArticleGrid(articles: mockArticles, heroScope: 'home')),
    ]);
  }
}
