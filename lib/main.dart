import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do/utils/custom_key.dart';
import 'package:to_do/views/splash_view.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To do',
      navigatorKey: CustomKey.navigatorKey,
      scaffoldMessengerKey: CustomKey.scaffoldMessengerKey,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(
              0xFF8F8F8F,
            ),
          ),
        ),
        primaryColor: const Color(
          0xFF28FDD7,
        ),
      ),
      home: const SplashView(),
    );
  }
}
