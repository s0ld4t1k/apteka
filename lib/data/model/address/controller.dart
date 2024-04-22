import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/address/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  bool isload = true;
  AddressModel addresses = AddressModel();
  @override
  void onInit() {
    get();
    super.onInit();
  }

  void get() async {
    isload = true;
    update();
    String url = '${baseUrl}user/address/';
    try {
      var res = await Dioo().dio.get(url);
      if (res.statusCode == 200) {
        addresses = AddressModel.fromJson(res.data);
        isload = false;
        update();
      }
    } catch (e) {
      debugPrint('------address=------$e');
    }
  }

  void patch(id, place, address, index) async {
    String url = '${baseUrl}address/update/$id/';
    try {
      var res = await Dioo()
          .dio
          .patch(url, data: {"place": place, "address": address});
      if (res.statusCode == 200) {
        addresses.detail?.loc?[index].place = place;
        addresses.detail?.loc?[index].address = address;
      }
      update();
    } catch (e) {
      debugPrint('-----update+address-----$e');
    }
  }

  void add(place, address) async {
    String url = '${baseUrl}address/';
    try {
      var res = await Dioo()
          .dio
          .post(url, data: {"place": place, "address": address});
      // print(res.statusCode);
      if (res.statusCode == 201) {
        addresses.detail?.loc?.add(Loc(place: place, address: address));
        // print('-------${addresses.detail?.loc ?? []}');
        update();
      }
      // print('---+++++----adr added');
      update();
    } catch (e) {
      debugPrint('-----add+address-----$e');
    }
  }

  Future<int> delete(id) async {
    String url = '${baseUrl}address/delete/$id/';
    try {
      var res = await Dioo().dio.delete(url);
      return res.statusCode ?? 0;
    } catch (e) {
      debugPrint('-----del+address-----$e');
      return 0;
    }
  }
}
