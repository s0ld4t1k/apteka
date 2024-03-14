class ProductModel {
  Detail? detail;

  ProductModel({this.detail});

  ProductModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  BrandFk? brandFk;
  CategoryFk? categoryFk;
  Subcategories? subcategoryFk;
  Title? title;
  Price? price;
  Price? lastPrice;
  int? humanType;
  Title? description;
  Title? composition;
  Title? indication;
  Title? contraindications;
  Title? sideEffects;
  Title? howToTakeTk;
  String? country;
  int? viewCount;
  int? stock;
  int? rate;
  int? reviewsSum;
  String? mainImage;
  List<Images>? images;
  List<Similars>? similars;
  List<Reviews>? reviews;

  Loc(
      {this.id,
      this.brandFk,
      this.categoryFk,
      this.subcategoryFk,
      this.title,
      this.price,
      this.lastPrice,
      this.humanType,
      this.description,
      this.composition,
      this.indication,
      this.contraindications,
      this.sideEffects,
      this.howToTakeTk,
      this.country,
      this.viewCount,
      this.stock,
      this.rate,
      this.reviewsSum,
      this.mainImage,
      this.images,
      this.similars,
      this.reviews});

  Loc.fromJson(Map<String, dynamic> json) {
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
    humanType = json['human_type'];
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    composition = json['composition'] != null
        ? new Title.fromJson(json['composition'])
        : null;
    indication = json['indication'] != null
        ? new Title.fromJson(json['indication'])
        : null;
    contraindications = json['contraindications'] != null
        ? new Title.fromJson(json['contraindications'])
        : null;
    sideEffects = json['side_effects'] != null
        ? new Title.fromJson(json['side_effects'])
        : null;
    howToTakeTk = json['how_to_take_tk'] != null
        ? new Title.fromJson(json['how_to_take_tk'])
        : null;
    country = json['country'];
    viewCount = json['view_count'];
    stock = json['stock'];
    rate = json['rate'];
    reviewsSum = json['reviews_sum'];
    mainImage = json['main_image'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['similars'] != null) {
      similars = <Similars>[];
      json['similars'].forEach((v) {
        similars!.add(new Similars.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
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
    data['human_type'] = this.humanType;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.composition != null) {
      data['composition'] = this.composition!.toJson();
    }
    if (this.indication != null) {
      data['indication'] = this.indication!.toJson();
    }
    if (this.contraindications != null) {
      data['contraindications'] = this.contraindications!.toJson();
    }
    if (this.sideEffects != null) {
      data['side_effects'] = this.sideEffects!.toJson();
    }
    if (this.howToTakeTk != null) {
      data['how_to_take_tk'] = this.howToTakeTk!.toJson();
    }
    data['country'] = this.country;
    data['view_count'] = this.viewCount;
    data['stock'] = this.stock;
    data['rate'] = this.rate;
    data['reviews_sum'] = this.reviewsSum;
    data['main_image'] = this.mainImage;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.similars != null) {
      data['similars'] = this.similars!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
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

class Title {
  String? tk;
  String? ru;
  String? en;

  Title({this.tk, this.ru, this.en});

  Title.fromJson(Map<String, dynamic> json) {
    tk = json['tk'];
    ru = json['ru'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tk'] = this.tk;
    data['ru'] = this.ru;
    data['en'] = this.en;
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

class Images {
  int? id;
  String? imgUrl;
  int? order;

  Images({this.id, this.imgUrl, this.order});

  Images.fromJson(Map<String, dynamic> json) {
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

class Similars {
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
  Images? image;

  Similars(
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

  Similars.fromJson(Map<String, dynamic> json) {
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
    image = json['image'] != null ? new Images.fromJson(json['image']) : null;
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

class Reviews {
  int? id;
  String? customer;
  String? subject;
  String? feedback;
  int? rate;
  String? createdAt;

  Reviews(
      {this.id,
      this.customer,
      this.subject,
      this.feedback,
      this.rate,
      this.createdAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['customer'];
    subject = json['subject'];
    feedback = json['feedback'];
    rate = json['rate'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer'] = this.customer;
    data['subject'] = this.subject;
    data['feedback'] = this.feedback;
    data['rate'] = this.rate;
    data['created_at'] = this.createdAt;
    return data;
  }
}
