import 'dart:convert';
/// success : true
/// message : "Course Fetched Successfully"
/// data : {"courses":[{"id":33,"thumbnail":"https://faculty.spagreen.net/demo/public/images/default/default-image-402x248.png","title":"Subaccount Labelling - RCP","total_lessons":0,"completed_lessons":1,"completed_percentage":"0%"},{"id":9,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20230814203740image_402x248-12.png","title":"Automate the Boring Stuff with Python Programming","total_lessons":10,"completed_lessons":1,"completed_percentage":"0%"},{"id":6,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20230827102924image_402x248-294.webp","title":"Javascript for Beginners","total_lessons":9,"completed_lessons":1,"completed_percentage":"0%"},{"id":5,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20230816062538image_402x248-190.png","title":"Full Practice Exam included + explanations | Learn Cloud Computing | Pass the AWS Cloud Practitioner CLF-C01 exam!","total_lessons":8,"completed_lessons":1,"completed_percentage":"0%"},{"id":4,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20230816062149image_402x248-330.png","title":"Build Native Cross-platform Apps with C#","total_lessons":14,"completed_lessons":1,"completed_percentage":"0%"},{"id":3,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231015221959image_402x248-167.png","title":"Getting CSS from Photoshop: The Very Basic No Code Approach","total_lessons":10,"completed_lessons":1,"completed_percentage":"0%"},{"id":1,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20240108165407image_402x248-483.png","title":"Mathematics with Animated Lessons Officia deserunt mollit","total_lessons":14,"completed_lessons":1,"completed_percentage":"0%"}]}

StudentCourseDataModel studentCourseDataModelFromJson(String str) => StudentCourseDataModel.fromJson(json.decode(str));
String studentCourseDataModelToJson(StudentCourseDataModel data) => json.encode(data.toJson());
class StudentCourseDataModel {
  StudentCourseDataModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  StudentCourseDataModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
StudentCourseDataModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => StudentCourseDataModel(  success: success ?? _success,
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

/// courses : [{"id":33,"thumbnail":"https://faculty.spagreen.net/demo/public/images/default/default-image-402x248.png","title":"Subaccount Labelling - RCP","total_lessons":0,"completed_lessons":1,"completed_percentage":"0%"},{"id":9,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20230814203740image_402x248-12.png","title":"Automate the Boring Stuff with Python Programming","total_lessons":10,"completed_lessons":1,"completed_percentage":"0%"},{"id":6,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20230827102924image_402x248-294.webp","title":"Javascript for Beginners","total_lessons":9,"completed_lessons":1,"completed_percentage":"0%"},{"id":5,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20230816062538image_402x248-190.png","title":"Full Practice Exam included + explanations | Learn Cloud Computing | Pass the AWS Cloud Practitioner CLF-C01 exam!","total_lessons":8,"completed_lessons":1,"completed_percentage":"0%"},{"id":4,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20230816062149image_402x248-330.png","title":"Build Native Cross-platform Apps with C#","total_lessons":14,"completed_lessons":1,"completed_percentage":"0%"},{"id":3,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231015221959image_402x248-167.png","title":"Getting CSS from Photoshop: The Very Basic No Code Approach","total_lessons":10,"completed_lessons":1,"completed_percentage":"0%"},{"id":1,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20240108165407image_402x248-483.png","title":"Mathematics with Animated Lessons Officia deserunt mollit","total_lessons":14,"completed_lessons":1,"completed_percentage":"0%"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<StudentCoursesData>? courses,}){
    _courses = courses;
}

  Data.fromJson(dynamic json) {
    if (json['courses'] != null) {
      _courses = [];
      json['courses'].forEach((v) {
        _courses?.add(StudentCoursesData.fromJson(v));
      });
    }
  }
  List<StudentCoursesData>? _courses;
Data copyWith({  List<StudentCoursesData>? courses,
}) => Data(  courses: courses ?? _courses,
);
  List<StudentCoursesData>? get courses => _courses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_courses != null) {
      map['courses'] = _courses?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 33
/// thumbnail : "https://faculty.spagreen.net/demo/public/images/default/default-image-402x248.png"
/// title : "Subaccount Labelling - RCP"
/// total_lessons : 0
/// completed_lessons : 1
/// completed_percentage : "0%"

StudentCoursesData coursesFromJson(String str) => StudentCoursesData.fromJson(json.decode(str));
String coursesToJson(StudentCoursesData data) => json.encode(data.toJson());
class StudentCoursesData {
  StudentCoursesData({
      num? id, 
      String? thumbnail, 
      String? title, 
      num? totalLessons, 
      num? completedLessons, 
      String? completedPercentage,}){
    _id = id;
    _thumbnail = thumbnail;
    _title = title;
    _totalLessons = totalLessons;
    _completedLessons = completedLessons;
    _completedPercentage = completedPercentage;
}

  StudentCoursesData.fromJson(dynamic json) {
    _id = json['id'];
    _thumbnail = json['thumbnail'];
    _title = json['title'];
    _totalLessons = json['total_lessons'];
    _completedLessons = json['completed_lessons'];
    _completedPercentage = json['completed_percentage'];
  }
  num? _id;
  String? _thumbnail;
  String? _title;
  num? _totalLessons;
  num? _completedLessons;
  String? _completedPercentage;
StudentCoursesData copyWith({  num? id,
  String? thumbnail,
  String? title,
  num? totalLessons,
  num? completedLessons,
  String? completedPercentage,
}) => StudentCoursesData(  id: id ?? _id,
  thumbnail: thumbnail ?? _thumbnail,
  title: title ?? _title,
  totalLessons: totalLessons ?? _totalLessons,
  completedLessons: completedLessons ?? _completedLessons,
  completedPercentage: completedPercentage ?? _completedPercentage,
);
  num? get id => _id;
  String? get thumbnail => _thumbnail;
  String? get title => _title;
  num? get totalLessons => _totalLessons;
  num? get completedLessons => _completedLessons;
  String? get completedPercentage => _completedPercentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['thumbnail'] = _thumbnail;
    map['title'] = _title;
    map['total_lessons'] = _totalLessons;
    map['completed_lessons'] = _completedLessons;
    map['completed_percentage'] = _completedPercentage;
    return map;
  }

}