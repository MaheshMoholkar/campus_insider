import 'package:campus_insider/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:campus_insider/features/daily_news/domain/entities/article.dart';
import 'package:campus_insider/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:campus_insider/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:campus_insider/features/daily_news/presentation/pages/saved_article/saved_article.dart';
import 'package:campus_insider/features/dashboard/presentation/pages/dashboard.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/DailyNews':
        return _materialRoute(DailyNews(queryValue: settings.arguments as String, queryType: settings.arguments as ArticleQueryType,));

      case '/Dashboard':
        return _materialRoute(Dashboard());

      case '/ArticleDetails':
        return _materialRoute(ArticleDetailsView(article: settings.arguments as ArticleEntity));

      case '/SavedArticles':
        return _materialRoute(const SavedArticles());

      default:
        return _materialRoute(Dashboard());
    }
  }

  static MaterialPageRoute _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
