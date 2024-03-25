class BannerModel {
  Detail? detail;

  BannerModel({this.detail});

  BannerModel.fromJson(Map<String, dynamic> json) {
    detail =
        json['detail'] != null ? Detail.fromJson(json['detail']) : null;
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
  String? imgUrl;
  String? url;
  String? location;

  Loc({this.imgUrl, this.url, this.location});

  Loc.fromJson(Map<String, dynamic> json) {
    imgUrl = json['img_url'];
    url = json['url'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['img_url'] = imgUrl;
    data['url'] = url;
    data['location'] = location;
    return data;
  }
}
