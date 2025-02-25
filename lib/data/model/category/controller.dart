import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/category/category_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category.dart';

class CategoryState {
  int page = 1;
  String categorySlug = '';
  String subcategorySlug = '';
  int selectedCategory = -1;
  int selectedSubategory = -1;
}

class CategoryController extends GetxController {
  CategoryState st = CategoryState();
  @override
  void onInit() {
    // st = CategoryState();
    get();
    super.onInit();
  }

  List<Color> clrs = [
    const Color.fromRGBO(255, 200, 201, 1),
    const Color.fromRGBO(184, 239, 240, 1),
    const Color.fromRGBO(224, 252, 211, 1),
    const Color.fromRGBO(255, 201, 169, 1),
    const Color.fromRGBO(200, 242, 239, 1)
  ];
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

  void getCategoryProducts(url2) async {
    debugPrint(url2);
    categoryProdyctIsload = true;
    update();
    try {
      var res = await Dioo().dio.get(url2);
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
    if (categoryProducts.detail?.loc?[0].pagination?.next ?? false) st.page++;
    getProductsPagination();
  }

  void changeUrl(s) {
    url2 = s;
    update();
  }
}
