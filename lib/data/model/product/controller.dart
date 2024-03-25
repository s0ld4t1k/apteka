import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/product/model.dart';
import 'package:get/get.dart';

import '../../../widgets/langDictionary.dart';

RxString productUrl = ''.obs;

class ProductController extends GetxController {
  @override
  void onInit() {
    get();
    super.onInit();
  }

  RxBool isload = true.obs;
  ProductModel product = ProductModel();
  void get() async {
    // print(baseUrl + productUrl.value.substring(1, productUrl.value.length));
    try {
      var res = await Dioo().dio.get(
          baseUrl + productUrl.value.substring(1, productUrl.value.length));
      if (res.statusCode == 200) {
        product = ProductModel.fromJson(res.data);
        update();
      }
    } catch (e) {
      print('-=-----------product $e');
    }
    // isload(false);
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
