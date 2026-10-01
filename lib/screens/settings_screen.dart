import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    final scheme = Theme.of(context).colorScheme;

    Widget swatch(String name, Color bg, Color fg) => Expanded(
          child: Container(
            height: 64,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                color: bg, borderRadius: BorderRadius.circular(12)),
            alignment: Alignment.center,
            child: Text(name, style: TextStyle(color: fg, fontSize: 12)),
          ),
        );

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Settings',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Card(
              elevation: 0,
              color: scheme.surfaceContainerLow,
              child: SwitchListTile(
                secondary: Icon(theme.isDark ? Icons.dark_mode : Icons.light_mode),
                title: const Text('Dark mode'),
                subtitle: const Text('Saved on this device'),
                value: theme.isDark,
                onChanged: theme.setDark,
              ),
            ),
            const SizedBox(height: 16),
            Text('Colors generated from the brand seed (#C62828)',
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),
            Row(children: [
              swatch('Primary', scheme.primary, scheme.onPrimary),
              swatch('Secondary', scheme.secondaryContainer,
                  scheme.onSecondaryContainer),
              swatch('Tertiary', scheme.tertiaryContainer,
                  scheme.onTertiaryContainer),
              swatch('Surface', scheme.surfaceContainerHighest,
                  scheme.onSurface),
            ]),
          ],
        ),
      ),
    );
  }
}
