class CategoryModel {
  Detail? detail;

  CategoryModel({this.detail});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
  Title? title;
  String? slug;
  List<Subcategories>? subcategories;
  String? imgUrl;
  int? productsCount;

  Loc(
      {this.id,
      this.title,
      this.slug,
      this.subcategories,
      this.imgUrl,
      this.productsCount});

  Loc.fromJson(Map<String, dynamic> json) {
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
