class CategoryProductsModel {
  Detail? detail;

  CategoryProductsModel({this.detail});

  CategoryProductsModel.fromJson(Map<String, dynamic> json) {
    detail =
        json['detail'] != null ? new Detail.fromJson(json['detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
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
        loc!.add(new Loc.fromJson(v));
      });
    }
    msg = json['msg'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loc != null) {
      data['loc'] = this.loc!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['type'] = this.type;
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
        ? new Pagination.fromJson(json['pagination'])
        : null;
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_pages'] = this.totalPages;
    data['current_page'] = this.currentPage;
    data['previous'] = this.previous;
    data['next'] = this.next;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tk'] = this.tk;
    data['ru'] = this.ru;
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
  Image? image;

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
        ? new BrandFk.fromJson(json['brand_fk'])
        : null;
    categoryFk = json['category_fk'] != null
        ? new CategoryFk.fromJson(json['category_fk'])
        : null;
    subcategoryFk = json['subcategory_fk'] != null
        ? new Subcategories.fromJson(json['subcategory_fk'])
        : null;
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    lastPrice = json['last_price'] != null
        ? new Price.fromJson(json['last_price'])
        : null;
    stock = json['stock'];
    absoluteUrl = json['absolute_url'];
    rate = json['rate'];
    reviewsSum = json['reviews_sum'];
    getAbsoluteUrl = json['get_absolute_url'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.brandFk != null) {
      data['brand_fk'] = this.brandFk!.toJson();
    }
    if (this.categoryFk != null) {
      data['category_fk'] = this.categoryFk!.toJson();
    }
    if (this.subcategoryFk != null) {
      data['subcategory_fk'] = this.subcategoryFk!.toJson();
    }
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    if (this.lastPrice != null) {
      data['last_price'] = this.lastPrice!.toJson();
    }
    data['stock'] = this.stock;
    data['absolute_url'] = this.absoluteUrl;
    data['rate'] = this.rate;
    data['reviews_sum'] = this.reviewsSum;
    data['get_absolute_url'] = this.getAbsoluteUrl;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['img_url'] = this.imgUrl;
    data['products_count'] = this.productsCount;
    data['get_absolute_url'] = this.getAbsoluteUrl;
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
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    slug = json['slug'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(new Subcategories.fromJson(v));
      });
    }
    imgUrl = json['img_url'];
    productsCount = json['products_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['slug'] = this.slug;
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories!.map((v) => v.toJson()).toList();
    }
    data['img_url'] = this.imgUrl;
    data['products_count'] = this.productsCount;
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
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    slug = json['slug'];
    imgUrl = json['img_url'];
    productsCount = json['products_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['slug'] = this.slug;
    data['img_url'] = this.imgUrl;
    data['products_count'] = this.productsCount;
    return data;
  }
}

class Price {
  double? price;
  bool? hasDiscount;
  int? oldPrice;

  Price({this.price, this.hasDiscount, this.oldPrice});

  Price.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    hasDiscount = json['has_discount'];
    oldPrice = json['old_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['has_discount'] = this.hasDiscount;
    data['old_price'] = this.oldPrice;
    return data;
  }
}

class Image {
  int? id;
  String? imgUrl;
  int? order;

  Image({this.id, this.imgUrl, this.order});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['img_url'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img_url'] = this.imgUrl;
    data['order'] = this.order;
    return data;
  }
}
