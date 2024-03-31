class ProductModel {
  Detail? detail;

  ProductModel({this.detail});

  ProductModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  BrandFk? brandFk;
  CategoryFk? categoryFk;
  Subcategories? subcategoryFk;
  Title? title;
  Price? price;
  Price? lastPrice;
  int? humanType;
  String? releaseForm;
  String? productionDate;
  String? expirationDate;
  int? volume;
  String? volumeType;
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
      this.releaseForm,
      this.productionDate,
      this.expirationDate,
      this.volume,
      this.volumeType,
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
    brandFk =
        json['brand_fk'] != null ? BrandFk.fromJson(json['brand_fk']) : null;
    categoryFk = json['category_fk'] != null
        ? CategoryFk.fromJson(json['category_fk'])
        : null;
    subcategoryFk = json['subcategory_fk'] != null
        ? Subcategories.fromJson(json['subcategory_fk'])
        : null;
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    lastPrice =
        json['last_price'] != null ? Price.fromJson(json['last_price']) : null;
    humanType = json['human_type'];
    releaseForm = json['release_form'];
    productionDate = json['production_date'];
    expirationDate = json['expiration_date'];
    volume = json['volume'];
    volumeType = json['volume_type'];
    description = json['description'] != null
        ? Title.fromJson(json['description'])
        : null;
    composition = json['composition'] != null
        ? Title.fromJson(json['composition'])
        : null;
    indication =
        json['indication'] != null ? Title.fromJson(json['indication']) : null;
    contraindications = json['contraindications'] != null
        ? Title.fromJson(json['contraindications'])
        : null;
    sideEffects = json['side_effects'] != null
        ? Title.fromJson(json['side_effects'])
        : null;
    howToTakeTk = json['how_to_take_tk'] != null
        ? Title.fromJson(json['how_to_take_tk'])
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
        images!.add(Images.fromJson(v));
      });
    }
    if (json['similars'] != null) {
      similars = <Similars>[];
      json['similars'].forEach((v) {
        similars!.add(Similars.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
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
    data['human_type'] = humanType;
    data['release_form'] = releaseForm;
    data['production_date'] = productionDate;
    data['expiration_date'] = expirationDate;
    data['volume'] = volume;
    data['volume_type'] = volumeType;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (composition != null) {
      data['composition'] = composition!.toJson();
    }
    if (indication != null) {
      data['indication'] = indication!.toJson();
    }
    if (contraindications != null) {
      data['contraindications'] = contraindications!.toJson();
    }
    if (sideEffects != null) {
      data['side_effects'] = sideEffects!.toJson();
    }
    if (howToTakeTk != null) {
      data['how_to_take_tk'] = howToTakeTk!.toJson();
    }
    data['country'] = country;
    data['view_count'] = viewCount;
    data['stock'] = stock;
    data['rate'] = rate;
    data['reviews_sum'] = reviewsSum;
    data['main_image'] = mainImage;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (similars != null) {
      data['similars'] = similars!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tk'] = tk;
    data['ru'] = ru;
    data['en'] = en;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['img_url'] = imgUrl;
    data['order'] = order;
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
    brandFk =
        json['brand_fk'] != null ? BrandFk.fromJson(json['brand_fk']) : null;
    categoryFk = json['category_fk'] != null
        ? CategoryFk.fromJson(json['category_fk'])
        : null;
    subcategoryFk = json['subcategory_fk'] != null
        ? Subcategories.fromJson(json['subcategory_fk'])
        : null;
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    lastPrice =
        json['last_price'] != null ? Price.fromJson(json['last_price']) : null;
    stock = json['stock'];
    absoluteUrl = json['absolute_url'];
    rate = json['rate'];
    reviewsSum = json['reviews_sum'];
    getAbsoluteUrl = json['get_absolute_url'];
    image = json['image'] != null ? Images.fromJson(json['image']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer'] = customer;
    data['subject'] = subject;
    data['feedback'] = feedback;
    data['rate'] = rate;
    data['created_at'] = createdAt;
    return data;
  }
}
