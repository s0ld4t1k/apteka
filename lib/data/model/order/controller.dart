import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/order/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  @override
  void onInit() {
    get();
    super.onInit();
  }

  bool isload = true;
  OrderModel orders = OrderModel();

  void get() async {
    isload = true;
    update();
    String url = '${baseUrl}user/orders/';
    try {
      var res = await Dioo().dio.get(url);
      if (res.statusCode == 200) {
        orders = OrderModel.fromJson(res.data);
      }
      isload = false;
      update();
    } catch (e) {
      debugPrint('----order=-----$e');
      get();
    }
  }
}
