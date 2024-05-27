import 'package:apte/controller/langController.dart';
import 'package:apte/pages/bag/bag.dart';
import 'package:apte/pages/kard/kard.dart';
import 'package:apte/pages/profile/adres.dart';
import 'package:apte/pages/profile/habarlasmak.dart';
import 'package:apte/pages/profile/profile.dart';
import 'package:apte/pages/profile/sargyt.dart';
import 'package:apte/pages/profile/user.dart';
import 'package:apte/pages/registration/registration.dart';
import 'package:apte/widgets/bag&Card/newAdres.dart';
import 'package:apte/pages/bag/sargytEtmek.dart';
import 'package:apte/pages/kategory/kategory.dart';
import 'package:apte/pages/leading/leading.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/main/mainPageWidget.dart';
import 'package:apte/pages/main/search.dart';
import 'package:apte/pages/main/searchPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

var langg = '';
var tokenn = '';

void main() async {
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('box');
  searchHistory = Hive.box('box').get('search') ?? [];
  langg = await const FlutterSecureStorage().read(key: 'lang') ?? '';
  if (langg != '') curLN = langg;
  tokenn = await const FlutterSecureStorage().read(key: 'token') ?? '';
  debugPrint('------tokenn-----$tokenn');
  Get.put(LangCont());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!);
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: green,
        ),
        brightness: Brightness.light,
        fontFamily: 'DMSans',
        primarySwatch: createMaterialColor(green),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize:
                MaterialStateProperty.all(const Size(double.infinity, 50)),
            backgroundColor: MaterialStateProperty.all(green),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 10)),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(54)),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontFamily: "DMSans",
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          shadowColor: Colors.white24,
          elevation: 2,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        primaryColor: green,
        primaryColorDark: green,
        primaryColorLight: green,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 10,
          shadowColor: Colors.black.withOpacity(1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Apteka',
      routes: {
        '/main': (context) => const MainPage(),
        '/reg': (context) => const Registration(),
        '/leading': (context) => const Leading(),
        '/mainPage': (context) => const MainPageWidget(),
        '/mainPage/search': (context) => const Searck(),
        '/mainPage/searchPage': (context) => const SearchPage(),
        '/kategory': (context) => const Kategory(),
        '/bag': (context) => const Bag(),
        '/bag/sargytEtmek': (context) => const SargytEtmek(),
        '/bag/salgym': (context) => const NewAdres(),
        '/kard': (context) => const Kard(),
        '/profile': (context) => const Profile(),
        '/profile/user': (context) => const User(),
        '/profile/habarlasmak': (context) => const Habarlasmak(),
        '/profile/adres': (context) => const Adres(),
        '/profile/sargyt': (context) => const Sargyt(),
      },
      initialRoute: (langg.isNotEmpty) ? '/main' : '/leading',
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
