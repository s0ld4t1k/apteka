import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/product/model.dart';
import 'package:apte/pages/main/productPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/langDictionary.dart';

RxString productUrl = ''.obs;

class ProductController extends GetxController {
  @override
  void onInit() {
    get();
    super.onInit();
  }

  bool like = false;
  RxBool isload = true.obs;
  ProductModel product = ProductModel();
  void get() async {
    print(baseUrl + productUrl.value.substring(1, productUrl.value.length));
    try {
      var res = await Dioo().dio.get(
          baseUrl + productUrl.value.substring(1, productUrl.value.length));
      if (res.statusCode == 200) {
        String url2 = '${baseUrl}user/whishlists/';
        product = ProductModel.fromJson(res.data);
        try {
          var res2 = await Dioo().dio.get(url2);
          for (var i = 0; i < res2.data['detail']['loc'].length; i++) {
            if (product.detail?.loc?[0].id ==
                res2.data['detail']['loc'][i]['id']) {
              like = true;
              update();
            }
          }
          update();
        } catch (e) {
          debugPrint('$e');
        }
        isClickProd(false);
        try {
          var res3 = await Dioo().dio.get('${baseUrl}cart/');
          for (var i = 0; i < res3.data['detail']['loc'].length; i++) {
            if (product.detail?.loc?[0].id ==
                res3.data['detail']['loc'][i]['product']) {
              countProd(res3.data['detail']['loc'][i]['quantity']);
              isClickProd(true);
              update();
            }
          }
          update();
        } catch (e) {
          debugPrint('$e');
        }
      }
    } catch (e) {
      debugPrint('-=-----------product $e');
    }
    isload(false);
    update();
  }

  String getTitle(s) {
    if (s != null) {
      if (curLN == 'ru') {
        return s.ru;
      } else if (curLN == 'en') {
        return s.en;
      } else {
        return s.tk;
      }
    }
    return '';
  }
}
