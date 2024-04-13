import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/pages/registration/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../products/model.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    get();
    getWhishlists();
    super.onInit();
  }

  ProductsModel whishlists = ProductsModel();
  TextEditingController nam = TextEditingController();
  TextEditingController tel = TextEditingController();
  bool isLoad = true;
  void get() async {
    isLoad = true;
    update();
    String url = 'user/me/';
    try {
      var res = await Dioo().dio.get(baseUrl + url);
      if (res.statusCode == 200) {
        nam.text = res.data['detail']['loc'][0]['first_name'];
        tel.text = res.data['detail']['loc'][0]['phone'];
        user.name = res.data['detail']['loc'][0]['first_name'];
        user.phone = res.data['detail']['loc'][0]['phone'];
      }
      isLoad = false;
      update();
    } catch (e) {
      debugPrint('---user-----$e');
    }
  }

  void getWhishlists() async {
    String url = 'user/whishlists/';
    try {
      var res = await Dioo().dio.get(baseUrl + url);
      if (res.statusCode == 200) {
        whishlists = ProductsModel.fromJson(res.data);
      }
    } catch (e) {
      debugPrint('----whishlist-------$e');
    }
    update();
  }
}
