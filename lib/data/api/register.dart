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

String baseUrl = 'https://ajayypgurlusyk.com.tm/apppi/api/v2/';
RxBool isSign = false.obs;
Future<void> sendSMS(UserModel user) async {
  String url = 'https://ajayypgurlusyk.com.tm/apppi/api/v2/send_sms/';
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
  isSign.value = true;
  String url = 'https://ajayypgurlusyk.com.tm/apppi/api/v2/login/';
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
  } finally {
    isSign.value = false;
  }
}

Future<void> register(UserModel userr, int otp) async {
  isSign.value = true;
  String url = 'https://ajayypgurlusyk.com.tm/apppi/api/v2/register/';
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
    if (e is DioException && e.response?.statusCode == null) {
      Dioo().conErr(() {});
    } else if (e is DioException) {
      print(e.response?.data['msg'].toString());
    }
  }
  isSign.value = false;
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
      String token = res.data['detail']['loc'][0];
      const FlutterSecureStorage().write(key: 'token', value: token);
      tokenn = token;
    }
    return res.statusMessage;
  } catch (e) {
    log('---resetPwd---$e');
    return '';
  }
}
