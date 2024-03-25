import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    get();
    super.onInit();
  }

  TextEditingController nam = TextEditingController();
  TextEditingController tel = TextEditingController();
  bool isLoad = true;
  void get() async {
    String url = 'user/me/';
    try {
      var res = await Dioo().dio.get(baseUrl + url);
      nam.text = res.data['detail']['loc'][0]['first_name'];
      tel.text = res.data['detail']['loc'][0]['phone'];

      isLoad = false;
      update();
    } catch (e) {
      debugPrint('---user-----$e');
      Dioo().conErr(get);
    }
  }
}
