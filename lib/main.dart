import 'package:campus_insider/config/routes/routes.dart';
import 'package:campus_insider/features/auth/presentation/pages/login.dart';
import 'package:campus_insider/injection_container.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const LoginPage()
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
