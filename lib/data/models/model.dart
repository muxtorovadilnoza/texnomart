class Model {
  bool? success;
  String? message;
  int? code;
  Data? data;

  Model({this.success, this.message, this.code, this.data});

  Model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {

  List<DataData>? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataData>[];
      json['data'].forEach((v) {
        data!.add(new DataData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataData {
  int? id;
  String? link;
  String? title;
  String? imageWeb;
  String? imageMobileWeb;

  DataData({this.id, this.link, this.title, this.imageWeb, this.imageMobileWeb});

  DataData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    title = json['title'];
    imageWeb = json['image_web'];
    imageMobileWeb = json['image_mobile_web'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    data['title'] = this.title;
    data['image_web'] = this.imageWeb;
    data['image_mobile_web'] = this.imageMobileWeb;
    return data;
  }
}