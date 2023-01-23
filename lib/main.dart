import 'package:flutter/material.dart';
import 'package:psikolog/pages/login_page.dart';
import 'package:psikolog/pages/main_page.dart';
import 'package:psikolog/pages/register_page.dart';
import 'package:provider/provider.dart';
import 'package:psikolog/pages/shcedules_page.dart';
import 'package:psikolog/pages/splash_page.dart';
import 'package:psikolog/pages/topic/topic_page.dart';
import 'package:psikolog/providers/auth_provider.dart';
import 'package:psikolog/providers/news_provider.dart';
import 'package:psikolog/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Konseling Psikolog',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const MainPage(),
          '/topics': (context) => const TopicPage(),
          '/schedules': (context) => const SchedulesPage(),
        },
        // home: RegisterPage(),
      ),
    );
  }
}
