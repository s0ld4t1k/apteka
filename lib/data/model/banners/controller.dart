import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/banners/model.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  @override
  void onInit() {
    get();
    super.onInit();
  }

  BannerModel banners = BannerModel();

  void get() async {
    String url = 'banners/';
    try {
      var res = await dio.get(baseUrl + url);
      if (res.statusCode == 200) {
        banners = BannerModel.fromJson(res.data);
      }
    } catch (e) {
      print('--------banner $e');
    }
    update();
  }
}
