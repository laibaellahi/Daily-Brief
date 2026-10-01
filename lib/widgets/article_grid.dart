import 'package:flutter/material.dart';

import '../models/article.dart';
import 'article_card.dart';

/// Adaptive layout: 1 column (ListView) on phones,
/// 2 or 3 columns (GridView) on tablet / web.
/// Uses LayoutBuilder on the CONTENT width (screen minus navigation rail).
class ArticleGrid extends StatelessWidget {
  final List<Article> articles;
  final String heroScope;

  const ArticleGrid({super.key, required this.articles, required this.heroScope});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, box) {
      final w = box.maxWidth;
      final columns = w < 560 ? 1 : (w < 900 ? 2 : 3);

      final Widget content = columns == 1
          ? ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: articles.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) =>
                  ArticleCard(article: articles[i], heroScope: heroScope),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.88,
              ),
              itemCount: articles.length,
              itemBuilder: (_, i) =>
                  ArticleCard(article: articles[i], heroScope: heroScope),
            );

      // Keep very wide web windows readable.
      return Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1300), child: content),
      );
    });
  }
}
