import 'dart:developer';

import 'package:apte/data/dio.dart';
import 'package:apte/data/user_model.dart';
import 'package:apte/main.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../widgets/colors.dart';

String baseUrl = 'http://216.250.11.197:8000/api/v2/';

Future<void> sendSMS(UserModel user) async {
  String url = 'http://216.250.11.197:8000/api/v2/send_sms/';
  try {
    var res = await Dio().post(url, data: {'phone': user.phone});
    user.sid = res.data['detail']['loc'][0]['sid'];
  } catch (e) {
    user.sid = null;
    debugPrint('---sms $e');
  }
  debugPrint('------sid   ${user.sid}');
}

Future<int> logIN(UserModel user) async {
  String url = 'http://216.250.11.197:8000/api/v2/login/';
  try {
    var res = await Dio()
        .post(url, data: {'phone': user.phone, 'password': user.password});
    String token = res.data['detail']['loc'][0];
    const FlutterSecureStorage().write(key: 'token', value: token);
    tokenn = token;
    return res.statusCode!;
  } catch (e) {
    debugPrint('---login $e');
    return 0;
  }
}

Future<void> register(UserModel userr, int otp) async {
  String url = 'http://216.250.11.197:8000/api/v2/register/';
  try {
    debugPrint(
        '${userr.sid} $otp ${userr.phone} ${userr.password} ${userr.name}');
    var res = await Dio().post(
      url,
      data: {
        'sid': userr.sid,
        'code': otp,
        'phone': userr.phone,
        'password': userr.password,
        'first_name': userr.name,
        'last_name': '-',
        'address': '-',
        'email': 'test@gmail.com'
      },
    );
    if (res.statusCode == 200) {
      int sc = await logIN(userr);
      if (sc == 200) {
        Get.offAll(() => const MainPage());
      } else {
        Get.snackbar(
          locale[curLN]!['loginError']!,
          locale[curLN]!['incorrectPassword']!,
          backgroundColor: red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        locale[curLN]!['loginError']!,
        locale[curLN]!['incorrectPassword']!,
        backgroundColor: red,
        colorText: Colors.white,
      );
    }
  } catch (e) {
    debugPrint('---registr $e');
  }
}

Future<String?> resetPassword(UserModel user, int code) async {
  debugPrint('${user.sid} $code ${user.phone} ${user.password}');
  try {
    String url = '${baseUrl}reset_password/';
    var res = await Dioo().dio.post(url, data: {
      'sid': user.sid,
      'code': code,
      'phone': user.phone,
      'password': user.password
    });
    if (res.statusCode == 200) {
      Get.snackbar(
        locale[curLN]!['resetPwdTitle']!,
        locale[curLN]!['resetPwdContent']!,
        backgroundColor: green,
        colorText: Colors.white,
      );
    }
    return res.statusMessage;
  } catch (e) {
    log('---resetPwd---$e');
    return '';
  }
}
