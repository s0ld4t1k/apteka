import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/products/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  @override
  void onInit() {
    getNewProducts();
    getMostsoldProducts();
    getRecommended();
    super.onInit();
  }

  bool? isLoadNew;
  bool? isLoadMostsold;
  bool? isLoadRecommended;
  ProductsModel newProducts = ProductsModel();
  ProductsModel mostsoldProducts = ProductsModel();
  ProductsModel recommendedProducts = ProductsModel();
  void getNewProducts() async {
    String url = 'products/new/';
    try {
      var res = await Dioo().dio.get(baseUrl + url);
      if (res.statusCode == 200) {
        newProducts = ProductsModel.fromJson(res.data);
        // print(newProducts);
      }
    } catch (e) {
      debugPrint('----new-------$e');
    }
    update();
  }

  void getMostsoldProducts() async {
    String url = 'products/mostsold/';
    try {
      var res = await Dioo().dio.get(baseUrl + url);
      if (res.statusCode == 200) {
        mostsoldProducts = ProductsModel.fromJson(res.data);
        // print(newProducts);
      }
    } catch (e) {
      debugPrint('----mostsold-------$e');
    }
    update();
  }

  void getRecommended() async {
    String url = 'products/recommended/';
    try {
      var res = await Dioo().dio.get(baseUrl + url);
      if (res.statusCode == 200) {
        recommendedProducts = ProductsModel.fromJson(res.data);
      }
    } catch (e) {
      debugPrint('----recommend-------$e');
    }
    update();
  }
}
