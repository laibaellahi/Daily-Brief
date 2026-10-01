import '../models/article.dart';

const categories = ['Technology', 'Sports', 'World', 'Business', 'Science'];

const _body =
    'Analysts say the development could reshape the industry over the coming '
    'years, with experts urging caution while the first results are reviewed.\n\n'
    'Reaction has been mixed. Supporters point to the potential benefits for '
    'everyday users, while critics argue more evidence is needed before any '
    'firm conclusions are drawn. Further updates are expected next week.';

const List<Article> mockArticles = [
  Article(id: '1', title: 'New AI chip promises faster on-device assistants', summary: 'A new processor brings large language models to phones without a cloud connection.', content: 'A new processor brings large language models to phones without a cloud connection.\n\n$_body', category: 'Technology', author: 'Sara Khan', date: 'Oct 1, 2026', readMinutes: 4),
  Article(id: '2', title: 'Lahore Qalandars clinch dramatic last-over win', summary: 'A stunning final over sealed the match in front of a packed stadium.', content: 'A stunning final over sealed the match in front of a packed stadium.\n\n$_body', category: 'Sports', author: 'Ali Raza', date: 'Oct 1, 2026', readMinutes: 3),
  Article(id: '3', title: 'World leaders meet to discuss climate finance', summary: 'Negotiators aim to agree on funding for countries hit hardest by climate change.', content: 'Negotiators aim to agree on funding for countries hit hardest by climate change.\n\n$_body', category: 'World', author: 'Hina Malik', date: 'Sep 30, 2026', readMinutes: 6),
  Article(id: '4', title: 'Startups see record funding in emerging markets', summary: 'Investors are shifting capital toward fast-growing regional tech hubs.', content: 'Investors are shifting capital toward fast-growing regional tech hubs.\n\n$_body', category: 'Business', author: 'Usman Tariq', date: 'Sep 30, 2026', readMinutes: 5),
  Article(id: '5', title: 'Telescope captures the clearest image of a distant galaxy', summary: 'Astronomers say the image reveals new details about early galaxy formation.', content: 'Astronomers say the image reveals new details about early galaxy formation.\n\n$_body', category: 'Science', author: 'Dr. Ayesha Noor', date: 'Sep 29, 2026', readMinutes: 7),
  Article(id: '6', title: 'Flutter release improves web performance and tooling', summary: 'The latest release focuses on faster startup and smoother scrolling on the web.', content: 'The latest release focuses on faster startup and smoother scrolling on the web.\n\n$_body', category: 'Technology', author: 'Sara Khan', date: 'Sep 29, 2026', readMinutes: 4),
  Article(id: '7', title: 'National team announces squad for upcoming series', summary: 'Selectors have named a balanced squad with several fresh faces.', content: 'Selectors have named a balanced squad with several fresh faces.\n\n$_body', category: 'Sports', author: 'Ali Raza', date: 'Sep 28, 2026', readMinutes: 3),
  Article(id: '8', title: 'Global markets steady ahead of key economic data', summary: 'Traders stay cautious as inflation figures are due later this week.', content: 'Traders stay cautious as inflation figures are due later this week.\n\n$_body', category: 'Business', author: 'Usman Tariq', date: 'Sep 28, 2026', readMinutes: 5),
];
