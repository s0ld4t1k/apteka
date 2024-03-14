import 'package:apte/data/api/register.dart';
import 'package:apte/data/dio.dart';
import 'package:apte/data/model/category/category_products.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:get/get.dart';

import 'category.dart';

class CategoryController extends GetxController {
  @override
  void onInit() {
    get();
    super.onInit();
  }

  String categorySlug = '';
  String subcategorySlug = '';
  int selectedCategory = 0;
  int selectedSubategory = 0;
  CategoryModel categories = CategoryModel();
  CategoryProductsModel categoryProducts = CategoryProductsModel();
  var url = 'categories/';
  bool isload = true;
  bool categoryProdyctIsload = true;

  void get() async {
    isload = true;
    update();
    try {
      var res = await dio.get(baseUrl + url);
      categories = CategoryModel.fromJson(res.data);

      categorySlug = categories.detail!.loc![selectedCategory].slug!;
      subcategorySlug = categories.detail!.loc![selectedCategory]
          .subcategories![selectedSubategory].slug!;
    } catch (e) {
      print('-=------category $e');
    }
    isload = false;
    update();
  }

  String getTitle(s) {
    if (curLN == 'en') {
      return s.en;
    } else if (curLN == 'ru') {
      return s.ru;
    } else {
      return s.tk;
    }
  }

  void getCategoryProducts() async {
    url = 'category/$categorySlug/subcategory/$subcategorySlug/';
    categoryProdyctIsload = true;
    update();
    print(url);

    try {
      var res = await dio.get(baseUrl + url);
      categoryProducts = CategoryProductsModel.fromJson(res.data);
      // print(categoryProducts);
    } catch (e) {
      print('-=------categoryProducts $e');
    }
    categoryProdyctIsload = false;
    update();
  }
}
