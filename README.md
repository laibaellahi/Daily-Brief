# 📰 Daily Brief: Responsive Flutter News Platform

A responsive news app built with Flutter that runs on **mobile, tablet, and web** from a single codebase. It features advanced navigation with GoRouter, Material Design 3 theming, adaptive layouts, Hero animations, and a persisted dark/light theme.

## ✨ Features

- **GoRouter navigation** with 4 routes and a `ShellRoute`
- **Material Design 3** theme generated from a single brand color (light + dark)
- **Adaptive layouts** that switch between a single column and a grid
- **Adaptive navigation**: bottom bar → rail → extended rail
- **Hero transition** from article card to detail page
- **Persisted theme toggle** using `shared_preferences`
- Category filtering with chips
- Image loading and error fallbacks

## 🧭 Routes

| Path | Screen | Purpose |
|---|---|---|
| `/` | HomeScreen | Top stories feed |
| `/categories` | CategoriesScreen | Filter articles by category |
| `/settings` | SettingsScreen | Dark mode switch and color preview |
| `/article/:id` | ArticleDetailScreen | Full article page |

## 📐 Responsive Behavior

| Device | Width | Navigation | Layout |
|---|---|---|---|
| Phone | < 600 px | Bottom NavigationBar | 1 column |
| Tablet | 600-999 px | NavigationRail | 2 columns |
| Web | 1000 px+ | Extended NavigationRail | 3 columns |


## 🛠 Tech Stack

- Flutter & Dart
- [go_router](https://pub.dev/packages/go_router)
- [provider](https://pub.dev/packages/provider)
- [shared_preferences](https://pub.dev/packages/shared_preferences)

## 📁 Project Structure

```
lib/
├── main.dart
├── app/            # router.dart, theme.dart
├── models/         # article.dart
├── data/           # mock_articles.dart
├── providers/      # theme_provider.dart
├── screens/        # home, categories, settings, article detail
└── widgets/        # app_shell, article_card, article_grid, news_image
```

## 🚀 Getting Started

```bash
# 1. Clone the repository
git clone https://github.com/laibaellahi/Daily-Brief.git
cd Daily-Brief

# 2. Generate platform folders (first time only)
flutter create --platforms=android,ios,web .

# 3. Install dependencies
flutter pub get

# 4. Run the app
flutter run -d chrome
```

> Images load from picsum.photos, so an internet connection is needed. Offline, a placeholder icon is shown.


## 👩‍💻 Author

**Laiba Ellahi**
BS Software Engineering, Superior University
GitHub: [@laibaellahi](https://github.com/laibaellahi)