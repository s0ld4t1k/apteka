import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/products/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearckController extends GetxController {
  @override
  void onInit() {
    get(query);
    super.onInit();
  }

  bool isload = true;
  ProductsModel searchProducts = ProductsModel();
  void get(query) async {
    String url = '${baseUrl}search/?query=$query';
    print(url);
    isload = true;
    update();
    try {
      var res = await Dioo().dio.get(url);

      if (res.statusCode == 200) {
        searchProducts = ProductsModel.fromJson(res.data);
        // print('------$searchProducts');
        isload = false;
        update();
      }
    } catch (e) {
      debugPrint('----search----$e');
      get(query);
    }
  }

  final String query;
  SearckController({required this.query});
}
