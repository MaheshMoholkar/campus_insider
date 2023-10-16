import 'package:equatable/equatable.dart';

abstract class RemoteArticlesEvent extends Equatable{
  const RemoteArticlesEvent();

  @override
  List<Object?> get props => [];
}

class GetArticles extends RemoteArticlesEvent {
  final String categoryName;

  const GetArticles(this.categoryName);

  @override
  List<Object?> get props => [categoryName];
}