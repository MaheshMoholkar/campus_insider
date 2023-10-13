import 'package:campus_insider/core/resources/data_state.dart';
import 'package:campus_insider/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}