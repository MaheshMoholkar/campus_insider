import 'package:campus_insider/core/resources/data_state.dart';
import 'package:campus_insider/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  // API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticlesByCategories(String category);
  
  Future<DataState<List<ArticleEntity>>> getNewsArticlesBySources(String source);

  Future<DataState<List<ArticleEntity>>> getNewsArticlesBySearch(String source);

  // Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);

}