import 'package:campus_insider/core/constants/constants.dart';
import 'package:campus_insider/features/daily_news/domain/entities/article.dart';
import 'package:campus_insider/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:campus_insider/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:campus_insider/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:campus_insider/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:campus_insider/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSection extends StatelessWidget {
  const HomeSection(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl<RemoteArticlesBloc>()..add(const GetArticles('general', ArticleQueryType.byCategories)),
      child: BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
        builder: (context, state) {
          if (state is RemoteArticleLoading) {
            return const Center(child: CupertinoActivityIndicator());
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
          } else {
            return const Center(child: Icon(Icons.refresh));
          }
        },
      ),
    );
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, 'ArticleDetails', arguments: article);
  }
}