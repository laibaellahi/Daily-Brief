class Article {
  final String id;
  final String title;
  final String summary;
  final String content;
  final String category;
  final String author;
  final String date;
  final int readMinutes;

  const Article({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
    required this.category,
    required this.author,
    required this.date,
    required this.readMinutes,
  });

  String get imageUrl => 'https://picsum.photos/seed/news$id/900/560';
}
