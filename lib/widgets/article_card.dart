import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/article.dart';
import 'news_image.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  /// Makes Hero tags unique per screen (home vs categories).
  final String heroScope;

  const ArticleCard({super.key, required this.article, required this.heroScope});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: scheme.surfaceContainerLow,
      child: InkWell(
        onTap: () => context.push('/article/${article.id}?s=$heroScope'),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Hero(
                tag: '$heroScope-${article.id}',
                child: NewsImage(url: article.imageUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.category.toUpperCase(),
                      style: text.labelSmall?.copyWith(
                          color: scheme.primary, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: text.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  Text(article.summary,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: text.bodySmall
                          ?.copyWith(color: scheme.onSurfaceVariant)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
