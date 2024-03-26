import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/products/model.dart';
import 'package:get/get.dart';

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
          // print(i);

          idList.add(res.data['detail']['loc'][i]['product']);
        }
        // print(idList);
        var res2 = await Dioo().dio.get('${baseUrl}products/?items=$idList');
        cartProducts = ProductsModel.fromJson(res2.data);
        isload = false;
        update();
      }
    } catch (e) {
      print('-------cart=---------$e');
      Dioo().conErr(get);
    }
  }
}
