import 'package:flutter/material.dart';
import 'package:texnomart/ui/pages/home_page.dart';
import 'package:texnomart/ui/pages/katalog_page/katalog.dart';
import 'package:texnomart/ui/pages/language_page.dart';
import 'package:texnomart/ui/pages/special_page/special_page.dart';
import 'package:texnomart/ui/pages/splash_page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    initialRoute: "/",
    routes: {
      '/': (context) => SplashPage(),
      '/language_page': (context) => LanguagePage(),
      '/home_page': (context) => HomePage(),
       '/special_page': (context) => SpecialPage(),
       '/katalog_page': (context) => KatalogPage(),
    });
  }
}

