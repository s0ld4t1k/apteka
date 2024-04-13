import 'package:apte/main.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/pages/registration/registration.dart';
import 'package:apte/pages/registration/sign_in.dart';
import 'package:apte/widgets/colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../widgets/langDictionary.dart';

class Dioo {
  var dio = Dio();

  bool checkToken() {
    if (tokenn.isEmpty || JwtDecoder.isExpired(tokenn)) {
      Dioo().loginDialog();
      return false;
    } else {
      return true;
    }
  }

  void conErr(ontap) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(locale[curLN]?['conErr'] ?? ''),
        content: Text(locale[curLN]?['try'] ?? ''),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back();
              ontap();
            },
            child: Text(locale[curLN]?['retry'] ?? ''),
          ),
        ],
      ),
    );
  }

  void logOut() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(locale[curLN]?['logOut'] ?? ''),
        content: Text(locale[curLN]?['logOutText'] ?? ''),
        actions: [
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(red.withOpacity(0.1)),
            ),
            onPressed: () => Get.back(),
            child: Text(
              locale[curLN]?['no'] ?? '',
              style: const TextStyle(color: red),
            ),
          ),
          TextButton(
            onPressed: () async {
              await const FlutterSecureStorage().delete(key: 'token');
              tokenn = '';
              selectedTab = 0;
              Get.offAll(() => const MainPage());
            },
            child: Text(locale[curLN]?['yes'] ?? ''),
          ),
        ],
      ),
    );
  }

  void loginDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text('${locale[curLN]?['auth']}'),
        content: Wrap(
          children: [
            ElevatedButton(
              onPressed: () => Get.to(() => const SignIn()),
              child: Text(locale[curLN]?['createAccount'] ?? ''),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () => Get.to(() => const Registration()),
              child: Text(locale[curLN]?['ulgamaGir'] ?? ''),
            ),
          ],
        ),
      ),
    );
  }

  static String getTitle(s) {
    if (s != null) {
      if (curLN == 'tm') {
        return s.tk;
      } else if (curLN == 'ru') {
        return s.ru;
      } else {
        try {
          return s.en;
        } catch (e) {
          return s.tk;
        }
      }
    } else {
      return '';
    }
  }

  Dioo() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers['Content-Type'] = 'application/json';

        if (tokenn.isNotEmpty) {
          options.headers['Authorization'] = tokenn;
        }
        return handler.next(options);
      },
    ));
  }
}
