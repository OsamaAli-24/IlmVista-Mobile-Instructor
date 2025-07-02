import 'dart:convert';

import 'package:lms_user_app/data/model/common/course.dart';
/// success : true
/// message : "Courses Retrieved"
/// data : {"courses":[{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","total_lessons":20,"total_enrolls":28,"is_free":false,"total_rating":"0.00","price":"$ 5.000,00","is_discounted":false,"discount_type":"","discounted_price":"$ 5.000,00","status":"Active"},{"id":8,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111124240image_402x248-483.png","title":"The Complete 2020 Fullstack Web Developer Course","total_lessons":9,"total_enrolls":6,"is_free":false,"total_rating":"0.00","price":"$ 16,00","is_discounted":false,"discount_type":"percent","discounted_price":"$ 16,00","status":"Active"},{"id":30,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111133421image_402x248-264.png","title":"Mobile games","total_lessons":3,"total_enrolls":3,"is_free":false,"total_rating":"0.00","price":"$ 1,22","is_discounted":false,"discount_type":"","discounted_price":"$ 1,22","status":"Inactive"}]}

CoursesByCategoryModel coursesByCategoryModelFromJson(String str) => CoursesByCategoryModel.fromJson(json.decode(str));
String coursesByCategoryModelToJson(CoursesByCategoryModel data) => json.encode(data.toJson());
class CoursesByCategoryModel {
  CoursesByCategoryModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  CoursesByCategoryModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
CoursesByCategoryModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => CoursesByCategoryModel(  success: success ?? _success,
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

/// courses : [{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","total_lessons":20,"total_enrolls":28,"is_free":false,"total_rating":"0.00","price":"$ 5.000,00","is_discounted":false,"discount_type":"","discounted_price":"$ 5.000,00","status":"Active"},{"id":8,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111124240image_402x248-483.png","title":"The Complete 2020 Fullstack Web Developer Course","total_lessons":9,"total_enrolls":6,"is_free":false,"total_rating":"0.00","price":"$ 16,00","is_discounted":false,"discount_type":"percent","discounted_price":"$ 16,00","status":"Active"},{"id":30,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111133421image_402x248-264.png","title":"Mobile games","total_lessons":3,"total_enrolls":3,"is_free":false,"total_rating":"0.00","price":"$ 1,22","is_discounted":false,"discount_type":"","discounted_price":"$ 1,22","status":"Inactive"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<Course>? courses,}){
    _courses = courses;
}

  Data.fromJson(dynamic json) {
    if (json['courses'] != null) {
      _courses = [];
      json['courses'].forEach((v) {
        _courses?.add(Course.fromJson(v));
      });
    }
  }
  List<Course>? _courses;
Data copyWith({  List<Course>? courses,
}) => Data(  courses: courses ?? _courses,
);
  List<Course>? get courses => _courses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_courses != null) {
      map['courses'] = _courses?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}