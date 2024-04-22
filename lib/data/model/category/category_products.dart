// import 'package:apte/data/model/products/model.dart';

class CategoryProductsModel {
  Detail? detail;

  CategoryProductsModel({this.detail});

  CategoryProductsModel.fromJson(Map<String, dynamic> json) {
    detail = json['detail'] != null ? Detail.fromJson(json['detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (detail != null) {
      data['detail'] = detail!.toJson();
    }
    return data;
  }
}

class Detail {
  List<Loc>? loc;
  String? msg;
  String? type;

  Detail({this.loc, this.msg, this.type});

  Detail.fromJson(Map<String, dynamic> json) {
    if (json['loc'] != null) {
      loc = <Loc>[];
      json['loc'].forEach((v) {
        loc!.add(Loc.fromJson(v));
      });
    }
    msg = json['msg'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (loc != null) {
      data['loc'] = loc!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    data['type'] = type;
    return data;
  }
}

class Loc {
  Pagination? pagination;
  Title? title;
  List<Products>? products;

  Loc({this.pagination, this.title, this.products});

  Loc.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? totalPages;
  int? currentPage;
  bool? previous;
  bool? next;

  Pagination({this.totalPages, this.currentPage, this.previous, this.next});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
    previous = json['previous'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_pages'] = totalPages;
    data['current_page'] = currentPage;
    data['previous'] = previous;
    data['next'] = next;
    return data;
  }
}

class Title {
  String? tk;
  String? ru;

  Title({this.tk, this.ru});

  Title.fromJson(Map<String, dynamic> json) {
    tk = json['tk'];
    ru = json['ru'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tk'] = tk;
    data['ru'] = ru;
    return data;
  }
}

class BrandFk {
  int? id;
  String? title;
  String? imgUrl;
  int? productsCount;
  String? getAbsoluteUrl;

  BrandFk(
      {this.id,
      this.title,
      this.imgUrl,
      this.productsCount,
      this.getAbsoluteUrl});

  BrandFk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imgUrl = json['img_url'];
    productsCount = json['products_count'];
    getAbsoluteUrl = json['get_absolute_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['img_url'] = imgUrl;
    data['products_count'] = productsCount;
    data['get_absolute_url'] = getAbsoluteUrl;
    return data;
  }
}

class CategoryFk {
  int? id;
  Title? title;
  String? slug;
  List<Subcategories>? subcategories;
  String? imgUrl;
  int? productsCount;

  CategoryFk(
      {this.id,
      this.title,
      this.slug,
      this.subcategories,
      this.imgUrl,
      this.productsCount});

  CategoryFk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    slug = json['slug'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(Subcategories.fromJson(v));
      });
    }
    imgUrl = json['img_url'];
    productsCount = json['products_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['slug'] = slug;
    if (subcategories != null) {
      data['subcategories'] = subcategories!.map((v) => v.toJson()).toList();
    }
    data['img_url'] = imgUrl;
    data['products_count'] = productsCount;
    return data;
  }
}

class Subcategories {
  int? id;
  Title? title;
  String? slug;
  String? imgUrl;
  int? productsCount;

  Subcategories(
      {this.id, this.title, this.slug, this.imgUrl, this.productsCount});

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    slug = json['slug'];
    imgUrl = json['img_url'];
    productsCount = json['products_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['slug'] = slug;
    data['img_url'] = imgUrl;
    data['products_count'] = productsCount;
    return data;
  }
}

class Price {
  double? price;
  bool? hasDiscount;
  dynamic oldPrice;

  Price({this.price, this.hasDiscount, this.oldPrice = 0.0});

  Price.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    hasDiscount = json['has_discount'];
    oldPrice = json['old_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['has_discount'] = hasDiscount;
    data['old_price'] = oldPrice;
    return data;
  }
}

class Imagee {
  int? id;
  String? imgUrl;
  int? order;

  Imagee({this.id, this.imgUrl, this.order});

  Imagee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['img_url'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['img_url'] = imgUrl;
    data['order'] = order;
    return data;
  }
}

class Products {
  int? id;
  BrandFk? brandFk;
  CategoryFk? categoryFk;
  Subcategories? subcategoryFk;
  Title? title;
  Price? price;
  Price? lastPrice;
  int? stock;
  String? absoluteUrl;
  int? rate;
  int? reviewsSum;
  String? getAbsoluteUrl;
  Imagee? image;

  Products(
      {this.id,
      this.brandFk,
      this.categoryFk,
      this.subcategoryFk,
      this.title,
      this.price,
      this.lastPrice,
      this.stock,
      this.absoluteUrl,
      this.rate,
      this.reviewsSum,
      this.getAbsoluteUrl,
      this.image});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandFk = json['brand_fk'] != null
        ? BrandFk.fromJson(json['brand_fk'])
        : null;
    categoryFk = json['category_fk'] != null
        ? CategoryFk.fromJson(json['category_fk'])
        : null;
    subcategoryFk = json['subcategory_fk'] != null
        ? Subcategories.fromJson(json['subcategory_fk'])
        : null;
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    lastPrice = json['last_price'] != null
        ? Price.fromJson(json['last_price'])
        : null;
    stock = json['stock'];
    absoluteUrl = json['absolute_url'];
    rate = json['rate'];
    reviewsSum = json['reviews_sum'];
    getAbsoluteUrl = json['get_absolute_url'];
    image = json['image'] != null ? Imagee.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (brandFk != null) {
      data['brand_fk'] = brandFk!.toJson();
    }
    if (categoryFk != null) {
      data['category_fk'] = categoryFk!.toJson();
    }
    if (subcategoryFk != null) {
      data['subcategory_fk'] = subcategoryFk!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (price != null) {
      data['price'] = price!.toJson();
    }
    if (lastPrice != null) {
      data['last_price'] = lastPrice!.toJson();
    }
    data['stock'] = stock;
    data['absolute_url'] = absoluteUrl;
    data['rate'] = rate;
    data['reviews_sum'] = reviewsSum;
    data['get_absolute_url'] = getAbsoluteUrl;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}
