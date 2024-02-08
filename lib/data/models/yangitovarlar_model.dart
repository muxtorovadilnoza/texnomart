class YangiTovarlarModel {
  bool? success;
  String? message;
  int? code;
  Data? data;

  YangiTovarlarModel({this.success, this.message, this.code, this.data});

  YangiTovarlarModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['message'] = message;
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<DataData3>? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataData3>[];
      json['data'].forEach((v) {
        data!.add(DataData3.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataData3 {
  int? id;
  String? name;
  String? image;
  String? availability;
  String? axiomMonthlyPrice;
  int? salePrice;
  dynamic oldPrice; // changed Null to dynamic
  int? reviewsCount;
  dynamic reviewsAverage; // changed Null to dynamic
  int? allCount;
  List<dynamic>? stickers; // changed Null to dynamic
  List<dynamic>? saleMonths; // changed Null to dynamic

  DataData3({
    this.id,
    this.name,
    this.image,
    this.availability,
    this.axiomMonthlyPrice,
    this.salePrice,
    this.oldPrice,
    this.reviewsCount,
    this.reviewsAverage,
    this.allCount,
    this.stickers,
    this.saleMonths,
  });

  DataData3.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    availability = json['availability'];
    axiomMonthlyPrice = json['axiom_monthly_price'];
    salePrice = json['sale_price'];
    oldPrice = json['old_price'];
    reviewsCount = json['reviews_count'];
    reviewsAverage = json['reviews_average'];
    allCount = json['all_count'];
    if (json['stickers'] != null) {
      stickers = <dynamic>[];
      json['stickers'].forEach((v) {
        stickers!.add(v);
      });
    }
    if (json['sale_months'] != null) {
      saleMonths = <dynamic>[];
      json['sale_months'].forEach((v) {
        saleMonths!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['availability'] = availability;
    data['axiom_monthly_price'] = axiomMonthlyPrice;
    data['sale_price'] = salePrice;
    data['old_price'] = oldPrice;
    data['reviews_count'] = reviewsCount;
    data['reviews_average'] = reviewsAverage;
    data['all_count'] = allCount;
    if (stickers != null) {
      data['stickers'] = stickers;
    }
    if (saleMonths != null) {
      data['sale_months'] = saleMonths;
    }
    return data;
  }
}
