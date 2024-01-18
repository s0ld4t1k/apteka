import 'package:apte/pages/bag/bag.dart';
import 'package:apte/pages/kard/kard.dart';
import 'package:apte/pages/profile/adres.dart';
import 'package:apte/pages/profile/changePW.dart';
import 'package:apte/pages/profile/habarlasmak.dart';
import 'package:apte/pages/profile/lang.dart';
import 'package:apte/pages/profile/like.dart';
import 'package:apte/pages/profile/profile.dart';
import 'package:apte/pages/profile/user.dart';
import 'package:apte/widgets/bag&Card/newAdres.dart';
import 'package:apte/widgets/bag&Card/newAdresManual.dart';
import 'package:apte/widgets/bag&Card/newCard.dart';
import 'package:apte/pages/bag/sargytEtmek.dart';
import 'package:apte/pages/kategory/kategory.dart';
import 'package:apte/pages/kategory/subKategory.dart';
import 'package:apte/pages/kategory/subKategoryPage.dart';
import 'package:apte/pages/leading/leading.dart';
import 'package:apte/pages/main/harmfulInfo.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/main/mainPageWidget.dart';
import 'package:apte/pages/main/productPage.dart';
import 'package:apte/pages/main/search.dart';
import 'package:apte/pages/main/searchPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/instance_manager.dart';

void main() {
  Future.delayed(Duration(seconds: 5));
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LangCont lc=Get.put(LangCont());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'DMSans',
        primarySwatch: createMaterialColor(green),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.all(0)),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
          )
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light
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
        '/leading':(context) => Leading(),
        '/mainPage':(context) => MainPageWidget(),
        '/mainPage/harmfulInfo':(context) => HarmfulInfo(),
        '/mainPage/search':(context) => Searck(),
        '/mainPage/searchPage':(context) => SearchPage(),
        '/mainPage/productPage':(context) => ProductPage(),
        '/kategory':(context) => Kategory(),
        '/kategory/subKategory':(context) => SubKategory(),
        '/kategory/subKategoryPage':(context) => SubKategoryPage(),
        '/bag':(context) => Bag(),
        '/bag/sargytEtmek':(context) => SargytEtmek(),
        '/bag/salgym':(context) => NewAdres(),
        '/bag/salgymManual':(context) => NewAdresManual(),
        '/kard':(context) => Kard(),
        '/kard/newCard':(context) => NewCard(),
        '/profile':(context) => Profile(),
        '/profile/user':(context) => User(),
        '/profile/user/changePW':(context) => ChangePW(),
        '/profile/lang':(context) => Language(),
        '/profile/habarlasmak':(context) => Habarlasmak(),
        '/profile/like':(context) => Like(),
        '/profile/adres':(context) => Adres(),
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