import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/mock_articles.dart';
import '../screens/article_detail_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/home_screen.dart';
import '../screens/settings_screen.dart';
import '../widgets/app_shell.dart';

final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

/// 4 routes: /  ,  /categories  ,  /settings  ,  /article/:id
final GoRouter appRouter = GoRouter(
  navigatorKey: _rootKey,
  initialLocation: '/',
  routes: [
    // Routes 1-3 live inside the adaptive shell (bottom bar / rail).
    ShellRoute(
      navigatorKey: _shellKey,
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(path: '/', builder: (c, s) => const HomeScreen()),
        GoRoute(path: '/categories', builder: (c, s) => const CategoriesScreen()),
        GoRoute(path: '/settings', builder: (c, s) => const SettingsScreen()),
      ],
    ),
    // Route 4: detail page, full screen (outside the shell) so Hero can fly.
    GoRoute(
      path: '/article/:id',
      parentNavigatorKey: _rootKey,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        final scope = state.uri.queryParameters['s'] ?? 'home';
        final article = mockArticles.firstWhere(
          (a) => a.id == id,
          orElse: () => mockArticles.first,
        );
        return ArticleDetailScreen(article: article, heroScope: scope);
      },
    ),
  ],
);
