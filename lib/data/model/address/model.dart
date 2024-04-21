class AddressModel {
  Detail? detail;

  AddressModel({this.detail});

  AddressModel.fromJson(Map<String, dynamic> json) {
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
  int? customer;
  int? place;
  String? address;
  Null apartment;
  Null room;
  Null latitude;
  Null longitude;

  Loc(
      {this.id,
      this.customer,
      this.place,
      this.address,
      this.apartment,
      this.room,
      this.latitude,
      this.longitude});

  Loc.fromJson(Map<String, dynamic> json) {
    customer = json['customer'];
    id = json['id'];
    place = json['place'];
    address = json['address'];
    apartment = json['apartment'];
    room = json['room'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer'] = customer;
    data['place'] = place;
    data['address'] = address;
    data['apartment'] = apartment;
    data['room'] = room;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
