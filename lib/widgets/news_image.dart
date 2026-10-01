import 'package:flutter/material.dart';

/// Network image with loading + error fallbacks (so offline never crashes).
class NewsImage extends StatelessWidget {
  final String url;
  const NewsImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Image.network(
      url,
      fit: BoxFit.cover,
      width: double.infinity,
      loadingBuilder: (context, child, progress) => progress == null
          ? child
          : Container(
              color: scheme.surfaceContainerHighest,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(strokeWidth: 2),
            ),
      errorBuilder: (context, error, stack) => Container(
        color: scheme.surfaceContainerHighest,
        alignment: Alignment.center,
        child: Icon(Icons.image_not_supported_outlined,
            color: scheme.onSurfaceVariant, size: 36),
      ),
    );
  }
}
