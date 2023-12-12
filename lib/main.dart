import 'package:campus_insider/features/auth/presentation/pages/startup.dart';
import 'package:campus_insider/features/auth/presentation/pages/login.dart';
import 'package:campus_insider/features/auth/presentation/pages/register.dart';
import 'package:campus_insider/features/daily_news/domain/entities/article.dart';
import 'package:campus_insider/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:campus_insider/features/dashboard/presentation/pages/dashboard.dart';
import 'package:campus_insider/features/dashboard/presentation/pages/profile.dart';
import 'package:campus_insider/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/constants/constants.dart';
import 'features/daily_news/presentation/pages/home/daily_news.dart';
import 'features/daily_news/presentation/pages/saved_article/saved_article.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: dashboardTheme(),
          home: const StartupPage(),
          routes: {
            'startup': (context) => const StartupPage(),
            'login': (context) => const MyLogin(),
            'register': (context) => const MyRegister(),
            'dashboard': (context) => Dashboard(),
            'DailyNews': (context) {
              final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
              final queryValue = arguments['queryValue'] as String;
              final queryType = arguments['queryType'] as ArticleQueryType;

              return DailyNews(
                queryValue: queryValue,
                queryType: queryType,
              );
            },

            'ArticleDetails': (context) => ArticleDetailsView(article: ModalRoute.of(context)!.settings.arguments as ArticleEntity),
            'SavedArticles': (context) => const SavedArticles(),
            'Profile': (context) => ProfileSection(),
          },
      );
  }

  ThemeData dashboardTheme() {
    return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Muli',
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
          titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
        )
    );
  }
}
