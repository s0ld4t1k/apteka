import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/products/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../pages/bag/bag.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    get();
    super.onInit();
  }

  bool isload = true;
  ProductsModel cartProducts = ProductsModel();
  var quantity = [];
  List<int> idList = [];

  void get() async {
    isload = true;
    update();
    try {
      var res = await Dioo().dio.get('${baseUrl}cart/');
      if (res.statusCode == 200) {
        quantity = res.data['detail']['loc'];
        for (var i = 0; i < res.data['detail']['loc'].length; i++) {
          idList.add(res.data['detail']['loc'][i]['product'] ?? 0);
        }
        var res2 = await Dioo().dio.get('${baseUrl}products/?items=$idList');
        cartProducts = ProductsModel.fromJson(res2.data);
        harytJemi.value = 0;

        if (res2.statusCode == 200) {
          for (var i = 0; i < idList.length; i++) {
            int quant = 1;
            for (var j = 0; j < (cartProducts.detail?.loc?.length ?? 0); j++) {
              if (cartProducts.detail?.loc?[j].id == idList[i]) {
                quant = quantity[i]['quantity'];
                harytJemi.value +=
                    (cartProducts.detail?.loc?[j].price?.price ?? 0.0) * quant;
              }
            }
          }
        }
        isload = false;
      }
    } catch (e) {
      debugPrint('-------cart=---------$e');
      // get();
      Dioo().conErr(get);
    }
    update();
  }

  void cleanCart() async {
    try {
      for (var i = 0; i < quantity.length; i++) {
        await Dioo().dio.post('${baseUrl}cart/', data: {
          'product': quantity[i]['product'],
          'quantity': quantity[i]['quantity'],
          'action': 'remove',
        });
      }
      cartProducts.detail?.loc?.clear();
      quantity.clear();
      debugPrint('${cartProducts.detail?.loc?.length}');
      harytJemi.value = 0;
      update();
    } catch (e) {
      debugPrint('--------clear cart--------$e');
    }
  }
}
