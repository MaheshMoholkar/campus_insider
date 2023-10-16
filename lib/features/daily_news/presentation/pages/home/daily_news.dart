import 'package:campus_insider/features/daily_news/domain/entities/article.dart';
import 'package:campus_insider/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:campus_insider/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:campus_insider/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:campus_insider/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:campus_insider/features/dashboard/presentation/widgets/app_bar.dart';
import 'package:campus_insider/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  final String categoryName;

  const DailyNews({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(categoryName + 'in dialynews');
    return BlocProvider<RemoteArticlesBloc>(
      key: ValueKey(categoryName),
      create: (context) => sl<RemoteArticlesBloc>()..add(GetArticles(categoryName)),
      child: Scaffold(
        appBar: buildAppBar(context),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
      builder: (_, state) {
        if (state is RemoteArticleLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticleException) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteArticleDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: state.articles![index],
                onArticlePressed: (article) => _onArticlePressed(context, article),
              );
            },
            itemCount: state.articles!.length,
          );
        }
        return const SizedBox();
      },
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }
}
