import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/article.dart';
import '../widgets/news_image.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Article article;
  final String heroScope;

  const ArticleDetailScreen(
      {super.key, required this.article, required this.heroScope});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          // If opened directly (web deep link) there is nothing to pop.
          onPressed: () => context.canPop() ? context.pop() : context.go('/'),
        ),
        title: Text(article.category),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Hero(
                    tag: '$heroScope-${article.id}', // same tag as the card
                    child: NewsImage(url: article.imageUrl),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(article.title,
                  style: text.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(
                '${article.author}  •  ${article.date}  •  ${article.readMinutes} min read',
                style: text.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
              ),
              const Divider(height: 32),
              Text(article.content, style: text.bodyLarge?.copyWith(height: 1.6)),
            ],
          ),
        ),
      ),
    );
  }
}
