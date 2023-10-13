import 'package:campus_insider/features/daily_news/domain/entities/article.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteArticlesState extends Equatable{
  final List<ArticleEntity> ? articles;
  final DioException ? exception;

  const RemoteArticlesState({this.articles, this.exception});

  @override
  List<Object> get props => [articles!, exception!];
}

class RemoteArticleLoading extends RemoteArticlesState {
  const RemoteArticleLoading();
}

class RemoteArticleDone extends RemoteArticlesState {
  const RemoteArticleDone(List<ArticleEntity> articles) : super(articles: articles);
}

class RemoteArticleException extends RemoteArticlesState {
  const RemoteArticleException(DioException exception) : super(exception: exception);
}
