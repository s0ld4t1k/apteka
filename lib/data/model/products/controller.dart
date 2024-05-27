import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/products/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsState {
  String url1 = '${baseUrl}products/new/?page=1&sort=price';
  String url2 = '${baseUrl}products/mostsold/?page=1&sort=price';
  String url3 = '${baseUrl}products/recommended/?page=1&sort=price';
  String url4 = '${baseUrl}products/new/?page=1&sort=price';
  String url5 = '${baseUrl}products/mostsold/?page=1&sort=price';
  String url6 = '${baseUrl}products/recommended/?page=1&sort=price';
  bool? isLoadNew;
  bool? isLoadMostsold;
  bool? isLoadRecommended;
  MainProductsModel newProducts = MainProductsModel();
  MainProductsModel mostsoldProducts = MainProductsModel();
  MainProductsModel recommendedProducts = MainProductsModel();
}

class ProductsController extends GetxController {
  ProductsState st = ProductsState();
  @override
  void onInit() {
    getNewProducts(st.url1);
    getMostsoldProducts(st.url2);
    getRecommended(st.url3);
    super.onInit();
  }

  void getNewProducts(url1) async {
    debugPrint(url1);
    try {
      var res = await Dioo().dio.get(url1);
      if (res.statusCode == 200) {
        st.newProducts = MainProductsModel.fromJson(res.data);
      }
    } catch (e) {
      debugPrint('----new-------$e');
    }
    update();
  }

  void change(String s) {
    if (s.contains('new')) st.url1 = s;
    if (s.contains('mostsold')) st.url2 = s;
    if (s.contains('recommend')) st.url3 = s;
    update();
  }

  void getMostsoldProducts(url2) async {
    debugPrint(url2);
    try {
      var res = await Dioo().dio.get(url2);
      if (res.statusCode == 200) {
        st.mostsoldProducts = MainProductsModel.fromJson(res.data);
      }
    } catch (e) {
      debugPrint('----mostsold-------$e');
    }
    update();
  }

  void getRecommended(url3) async {
    debugPrint(url3);
    try {
      var res = await Dioo().dio.get(url3);
      if (res.statusCode == 200) {
        st.recommendedProducts = MainProductsModel.fromJson(res.data);
      }
    } catch (e) {
      debugPrint('----recommend-------$e');
    }
    update();
  }
}
