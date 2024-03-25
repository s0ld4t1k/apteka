import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../widgets/langDictionary.dart';

class Dioo {
  var dio = Dio();
  void conErr(ontap) {
    Get.dialog(
      AlertDialog(
        title: const Text('Connection error'),
        content: const Text('Please try again'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back();
              ontap();
            },
            child: const Text('Retry'),
          ),
        ],
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
      onRequest: (options, handler) async {
        options.headers['Content-Type'] = 'application/json';
        String? token = await const FlutterSecureStorage().read(key: 'token');
        if (token!.isNotEmpty) {
          options.headers['Authorization'] = token;
        }
        return handler.next(options);
      },
    ));
  }
}
