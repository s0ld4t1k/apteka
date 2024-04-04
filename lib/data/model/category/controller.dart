import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/category/category_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category.dart';

class CategoryController extends GetxController {
  @override
  void onInit() {
    get();
    super.onInit();
  }

  List<Color> clrs = [
    const Color.fromRGBO(255, 200, 201, 1),
    const Color.fromRGBO(184, 239, 240, 1),
    const Color.fromRGBO(224, 252, 211, 1),
    const Color.fromRGBO(255, 201, 169, 1),
    const Color.fromRGBO(200, 242, 239, 1),
  ];
  int page = 1;
  String categorySlug = '';
  String subcategorySlug = '';
  int selectedCategory = 0;
  int selectedSubategory = 0;
  CategoryModel categories = CategoryModel();
  CategoryProductsModel categoryProducts = CategoryProductsModel();
  var url = 'categories/';
  String url2 = '';
  bool isload = true;
  bool isErr = false;
  bool categoryProdyctIsload = true;
  bool paginationIsload = true;

  void get() async {
    try {
      isErr = false;
      isload = true;
      update();
      var res = await Dioo().dio.get(baseUrl + url);
      if (res.statusCode == 200) {
        categories = CategoryModel.fromJson(res.data);
      }
      isErr = false;
    } catch (e) {
      isErr = true;
      debugPrint('-=------category $e');
      update();
      Dioo().conErr(get);
    }
    isload = false;
    update();
  }

  void getCategoryProducts(url) async {
    debugPrint(url);
    categoryProdyctIsload = true;
    update();
    try {
      var res = await Dioo().dio.get(url);
      categoryProducts = CategoryProductsModel.fromJson(res.data);
    } catch (e) {
      debugPrint('-=------categoryProducts $e');
    }
    categoryProdyctIsload = false;
    update();
  }

  void getProductsPagination() async {
    paginationIsload = true;
    update();
    try {
      var res = await Dioo().dio.get(url2);
      categoryProducts = CategoryProductsModel.fromJson(res.data);
    } catch (e) {
      debugPrint('-=------categoryProducts $e');
    }
    paginationIsload = false;
    update();
  }

  void incPage() {
    if (categoryProducts.detail?.loc?[0].pagination?.next ?? false) page++;
    getProductsPagination();
  }
}
