import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/products/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  @override
  void onInit() {
    getNewProducts(url1);
    getMostsoldProducts(url2);
    getRecommended(url3);
    super.onInit();
  }

  String url1 = '${baseUrl}products/new/?page=1&sort=price';
  String url2 = '${baseUrl}products/mostsold/?page=1&sort=price';
  String url3 = '${baseUrl}products/recommended/?page=1&sort=price';
  bool? isLoadNew;
  bool? isLoadMostsold;
  bool? isLoadRecommended;
  MainProductsModel newProducts = MainProductsModel();
  MainProductsModel mostsoldProducts = MainProductsModel();
  MainProductsModel recommendedProducts = MainProductsModel();
  void getNewProducts(url1) async {
    print(url1);
    try {
      var res = await Dioo().dio.get(url1);
      if (res.statusCode == 200) {
        newProducts = MainProductsModel.fromJson(res.data);
      }
    } catch (e) {
      debugPrint('----new-------$e');
    }
    update();
  }

  void change(String s) {
    int t = 0;
    if (s.contains('new')) t = 1;
    if (s.contains('mostsold')) t = 2;
    if (s.contains('recommend')) t = 3;
    if (t == 1) {
      url1 = s;
    }
    if (t == 2) {
      url2 = s;
    }
    if (t == 3) {
      url3 = s;
    }
    update();
  }

  void getMostsoldProducts(url2) async {
    print(url2);
    try {
      var res = await Dioo().dio.get(url2);
      if (res.statusCode == 200) {
        mostsoldProducts = MainProductsModel.fromJson(res.data);
      }
    } catch (e) {
      debugPrint('----mostsold-------$e');
    }
    update();
  }

  void getRecommended(url3) async {
    print(url3);
    try {
      var res = await Dioo().dio.get(url3);
      if (res.statusCode == 200) {
        recommendedProducts = MainProductsModel.fromJson(res.data);
      }
    } catch (e) {
      debugPrint('----recommend-------$e');
    }
    update();
  }
}
