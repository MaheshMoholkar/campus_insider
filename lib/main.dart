import 'package:campus_insider/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:campus_insider/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:campus_insider/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:campus_insider/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
  return BlocProvider<RemoteArticlesBloc> (
    create: (context) => sl()..add(const GetArticles()),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const DailyNews(),
      )
    );
  }
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme(){
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}
