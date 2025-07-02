import 'dart:convert';
/// success : true
/// message : "Categories Retrieved"
/// data : {"categories":[{"id":4,"title":"Business","icon":"https://faculty.spagreen.net/demo/public/images/20231111193051image_40x40_media_204.png","total_courses":0},{"id":2,"title":"Web Development","icon":"https://faculty.spagreen.net/demo/public/images/20231111192713image_40x40_media_327.png","total_courses":7},{"id":5,"title":"Finance & Accounting","icon":"https://faculty.spagreen.net/demo/public/images/20231111193308image_40x40_media_327.png","total_courses":1},{"id":3,"title":"Flutter","icon":"https://faculty.spagreen.net/demo/public/images/20231111192717image_40x40_media_21.png","total_courses":1},{"id":6,"title":"Office Productivity","icon":"https://faculty.spagreen.net/demo/public/images/20231111193052image_40x40_media_450.png","total_courses":0},{"id":7,"title":"Design","icon":"https://faculty.spagreen.net/demo/public/images/20231111193051image_40x40_media_259.png","total_courses":0},{"id":8,"title":"Marketting","icon":"https://faculty.spagreen.net/demo/public/images/20231111193309image_40x40_media_300.png","total_courses":0},{"id":9,"title":"Lifestyle","icon":"https://faculty.spagreen.net/demo/public/images/20231111193308image_40x40_media_94.png","total_courses":0},{"id":1,"title":"Web Design","icon":"https://faculty.spagreen.net/demo/public/images/20231111192656image_40x40_media_193.png","total_courses":6},{"id":10,"title":"Health & Fitness","icon":"https://faculty.spagreen.net/demo/public/images/20231111193309image_40x40_media_456.png","total_courses":0}]}

CourseCategoryModel courseCategoryModelFromJson(String str) => CourseCategoryModel.fromJson(json.decode(str));
String courseCategoryModelToJson(CourseCategoryModel data) => json.encode(data.toJson());
class CourseCategoryModel {
  CourseCategoryModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  CourseCategoryModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
CourseCategoryModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => CourseCategoryModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// categories : [{"id":4,"title":"Business","icon":"https://faculty.spagreen.net/demo/public/images/20231111193051image_40x40_media_204.png","total_courses":0},{"id":2,"title":"Web Development","icon":"https://faculty.spagreen.net/demo/public/images/20231111192713image_40x40_media_327.png","total_courses":7},{"id":5,"title":"Finance & Accounting","icon":"https://faculty.spagreen.net/demo/public/images/20231111193308image_40x40_media_327.png","total_courses":1},{"id":3,"title":"Flutter","icon":"https://faculty.spagreen.net/demo/public/images/20231111192717image_40x40_media_21.png","total_courses":1},{"id":6,"title":"Office Productivity","icon":"https://faculty.spagreen.net/demo/public/images/20231111193052image_40x40_media_450.png","total_courses":0},{"id":7,"title":"Design","icon":"https://faculty.spagreen.net/demo/public/images/20231111193051image_40x40_media_259.png","total_courses":0},{"id":8,"title":"Marketting","icon":"https://faculty.spagreen.net/demo/public/images/20231111193309image_40x40_media_300.png","total_courses":0},{"id":9,"title":"Lifestyle","icon":"https://faculty.spagreen.net/demo/public/images/20231111193308image_40x40_media_94.png","total_courses":0},{"id":1,"title":"Web Design","icon":"https://faculty.spagreen.net/demo/public/images/20231111192656image_40x40_media_193.png","total_courses":6},{"id":10,"title":"Health & Fitness","icon":"https://faculty.spagreen.net/demo/public/images/20231111193309image_40x40_media_456.png","total_courses":0}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<Categories>? categories,}){
    _categories = categories;
}

  Data.fromJson(dynamic json) {
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
  }
  List<Categories>? _categories;
Data copyWith({  List<Categories>? categories,
}) => Data(  categories: categories ?? _categories,
);
  List<Categories>? get categories => _categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 4
/// title : "Business"
/// icon : "https://faculty.spagreen.net/demo/public/images/20231111193051image_40x40_media_204.png"
/// total_courses : 0

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));
String categoriesToJson(Categories data) => json.encode(data.toJson());
class Categories {
  Categories({
      num? id, 
      String? title, 
      String? icon, 
      num? totalCourses,}){
    _id = id;
    _title = title;
    _icon = icon;
    _totalCourses = totalCourses;
}

  Categories.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _icon = json['icon'];
    _totalCourses = json['total_courses'];
  }
  num? _id;
  String? _title;
  String? _icon;
  num? _totalCourses;
Categories copyWith({  num? id,
  String? title,
  String? icon,
  num? totalCourses,
}) => Categories(  id: id ?? _id,
  title: title ?? _title,
  icon: icon ?? _icon,
  totalCourses: totalCourses ?? _totalCourses,
);
  num? get id => _id;
  String? get title => _title;
  String? get icon => _icon;
  num? get totalCourses => _totalCourses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['icon'] = _icon;
    map['total_courses'] = _totalCourses;
    return map;
  }

}