import 'package:campus_insider/core/resources/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:campus_insider/features/daily_news/domain/use_cases/get_article.dart';
import 'package:campus_insider/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:campus_insider/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {

  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticlesState> emit) async {
    final queryType = event.queryType;
    final queryValue = event.queryValue;

    final dataState = await _getArticleUseCase.call(params: {
      'queryType': queryType,
      'queryValue': queryValue,
    });

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteArticleDone(dataState.data!),
      );
    }
    if (dataState is DataFailed) {
      emit(
        RemoteArticleException(dataState.error!),
      );
    }
  }
}
