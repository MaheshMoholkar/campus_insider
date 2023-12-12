import 'package:campus_insider/core/constants/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:campus_insider/features/daily_news/domain/use_cases/get_article.dart';

abstract class RemoteArticlesEvent extends Equatable {
  const RemoteArticlesEvent();

  @override
  List<Object?> get props => [];
}

class GetArticles extends RemoteArticlesEvent {
  final String queryValue;
  final ArticleQueryType queryType;

  const GetArticles(this.queryValue, this.queryType);

  @override
  List<Object?> get props => [queryValue, queryType];
}
