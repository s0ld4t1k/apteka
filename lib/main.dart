import 'package:apte/pages/leading/leading.dart';
import 'package:apte/pages/main/harmfulInfo.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/main/mainPageWidget.dart';
import 'package:apte/pages/main/search.dart';
import 'package:apte/pages/main/searchPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  Future.delayed(Duration(seconds: 5));
  FlutterNativeSplash.remove();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'DMSans',
        primarySwatch: createMaterialColor(green),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark
          ),
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          shadowColor: Colors.white24,
          elevation: 2,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Apteka',
      routes: {
        '/':(context) => MainPage(),
        '/mainPage':(context) => MainPageWidget(),
        '/mainPage/harmfulInfo':(context) => HarmfulInfo(),
        '/mainPage/search':(context) => Searck(),
        '/mainPage/searchPage':(context) => SearchPage(),
        '/leading':(context) => Leading(),
      },
      initialRoute: '/',
    );
  }
}
MaterialColor createMaterialColor(Color color) {
  List<int> strengths = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;
  for (int strength in strengths) {
    final double weight = 1.0 - (strength / 900.0);
    swatch[strength] = Color.fromRGBO(
      r + ((255 - r) * weight).round(),
      g + ((255 - g) * weight).round(),
      b + ((255 - b) * weight).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}