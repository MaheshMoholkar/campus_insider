import 'package:campus_insider/core/constants/constants.dart';
import 'package:campus_insider/core/resources/data_state.dart';
import 'package:campus_insider/core/use-cases/use-case.dart';
import 'package:campus_insider/features/daily_news/domain/entities/article.dart';
import 'package:campus_insider/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, Map<String, dynamic>> {

  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({required Map<String, dynamic> params}) {
    final ArticleQueryType queryType = params['queryType'];
    final String queryValue = params['queryValue'];

    switch (queryType) {
      case ArticleQueryType.byCategories:
        return _articleRepository.getNewsArticlesByCategories(queryValue);
      case ArticleQueryType.bySources:
        return _articleRepository.getNewsArticlesBySources(queryValue);
      case ArticleQueryType.bySearch:
        return _articleRepository.getNewsArticlesBySearch(queryValue);
      default:
        return _articleRepository.getNewsArticlesByCategories(queryValue);
    }
  }
}
