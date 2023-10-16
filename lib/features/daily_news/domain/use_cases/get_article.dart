import 'package:campus_insider/core/resources/data_state.dart';
import 'package:campus_insider/core/use-cases/use-case.dart';
import 'package:campus_insider/features/daily_news/domain/entities/article.dart';
import 'package:campus_insider/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, String>{

  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({required String params}) {
    return _articleRepository.getNewsArticles(params);
  }
}