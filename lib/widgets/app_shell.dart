import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class _Tab {
  final String path;
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  const _Tab(this.path, this.icon, this.selectedIcon, this.label);
}

const _tabs = [
  _Tab('/', Icons.newspaper_outlined, Icons.newspaper, 'Home'),
  _Tab('/categories', Icons.category_outlined, Icons.category, 'Categories'),
  _Tab('/settings', Icons.settings_outlined, Icons.settings, 'Settings'),
];

/// Adaptive navigation:
///  phone  (<600)   -> bottom NavigationBar
///  tablet (600+)   -> NavigationRail (icons + labels)
///  web    (1000+)  -> extended NavigationRail
class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final loc = GoRouterState.of(context).uri.path;
    final i = _tabs.indexWhere(
        (t) => t.path == '/' ? loc == '/' : loc.startsWith(t.path));
    return i < 0 ? 0 : i;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final index = _currentIndex(context);
    final isWide = width >= 600;
    final extended = width >= 1000;
    final theme = context.watch<ThemeProvider>();
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Icon(Icons.newspaper, color: scheme.primary),
          const SizedBox(width: 8),
          const Text('Daily Brief',
              style: TextStyle(fontWeight: FontWeight.w800)),
        ]),
        actions: [
          IconButton(
            tooltip: 'Toggle theme',
            icon: Icon(theme.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: theme.toggle,
          ),
        ],
      ),
      body: Row(children: [
        if (isWide)
          NavigationRail(
            selectedIndex: index,
            extended: extended,
            labelType: extended
                ? NavigationRailLabelType.none
                : NavigationRailLabelType.all,
            onDestinationSelected: (i) => context.go(_tabs[i].path),
            destinations: [
              for (final t in _tabs)
                NavigationRailDestination(
                  icon: Icon(t.icon),
                  selectedIcon: Icon(t.selectedIcon),
                  label: Text(t.label),
                ),
            ],
          ),
        Expanded(child: child),
      ]),
      bottomNavigationBar: isWide
          ? null
          : NavigationBar(
              selectedIndex: index,
              onDestinationSelected: (i) => context.go(_tabs[i].path),
              destinations: [
                for (final t in _tabs)
                  NavigationDestination(
                    icon: Icon(t.icon),
                    selectedIcon: Icon(t.selectedIcon),
                    label: t.label,
                  ),
              ],
            ),
    );
  }
}
