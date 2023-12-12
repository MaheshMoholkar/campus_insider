import 'package:campus_insider/features/daily_news/domain/entities/article.dart';
import 'package:campus_insider/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:campus_insider/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:campus_insider/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:campus_insider/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:campus_insider/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedArticles extends StatelessWidget {
  const SavedArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalArticleBloc>()..add(const GetSavedArticles()),
      child: BlocBuilder<LocalArticleBloc, LocalArticlesState>(
        builder: (context, state) {
          if (state is LocalArticlesLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is LocalArticlesDone) {
            return _buildArticlesList(state.articles!);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildArticlesList(List<ArticleEntity> articles) {
    if (articles.isEmpty) {
      return const Center(
        child: Text(
          'NO SAVED ARTICLES',
          style: TextStyle(color: Colors.black),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleWidget(
          article: articles[index],
          isRemovable: true,
          onRemove: (article) => _onRemoveArticle(context, article),
          onArticlePressed: (article) => _onArticlePressed(context, article),
        );
      },
    );
  }

  void _onRemoveArticle(BuildContext context, ArticleEntity article) {
    BlocProvider.of<LocalArticleBloc>(context).add(RemoveArticle(article));
  }

  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }
}