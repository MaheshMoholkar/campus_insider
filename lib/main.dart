import 'package:campus_insider/config/routes/routes.dart';
import 'package:campus_insider/features/auth/presentatation/pages/login.dart';
import 'package:campus_insider/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:campus_insider/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:campus_insider/features/dashboard/presentation/pages/dashboard.dart';
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
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: dashboardTheme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const LoginPage()
      ),
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
