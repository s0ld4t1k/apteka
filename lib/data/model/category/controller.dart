import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/category/category_products.dart';
import 'package:apte/widgets/langDictionary.dart';
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
  String categorySlug = '';
  String subcategorySlug = '';
  int selectedCategory = 0;
  int selectedSubategory = 0;
  CategoryModel categories = CategoryModel();
  CategoryProductsModel categoryProducts = CategoryProductsModel();
  var url = 'categories/';
  bool isload = true;
  bool isErr = false;
  bool categoryProdyctIsload = true;

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
      print('-=------category $e');
      update();
      Dioo().conErr(get);
    }
    isload = false;
    update();
  }

  String getTitle(s) {
    if (curLN == 'tm') {
      return s.tk;
    } else if (curLN == 'ru') {
      return s.ru;
    } else {
      try {
        return s.en;
      } catch (e) {
        return s.tk;
      }
    }
  }

  void getCategoryProducts() async {
    categorySlug = categories.detail!.loc![selectedCategory].slug!;
    subcategorySlug = categories.detail!.loc![selectedCategory]
        .subcategories![selectedSubategory].slug!;
    url = 'category/$categorySlug/subcategory/$subcategorySlug/';
    print(url);
    categoryProdyctIsload = true;
    update();
    print(url);
    try {
      var res = await Dioo().dio.get(baseUrl + url);
      categoryProducts = CategoryProductsModel.fromJson(res.data);
      // print(categoryProducts);
    } catch (e) {
      print('-=------categoryProducts $e');
    }
    categoryProdyctIsload = false;
    update();
  }
}
