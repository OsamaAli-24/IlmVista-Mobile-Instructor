import 'dart:convert';
/// success : true
/// message : "dashboard_data_fetched_successfully"
/// data : {"total_student":7,"total_course":3,"total_earning":"$ 100,00","total_enrollment":37,"enroll_stats":{"Jan":2,"Feb":0,"Mar":0,"Apr":0,"May":0,"Jun":0,"Jul":0,"Aug":0,"Sep":0,"Oct":0,"Nov":0,"Dec":0},"latest_enrolls":[{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"20 Jan 2024"},{"id":8,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111124240image_402x248-483.png","title":"The Complete 2020 Fullstack Web Developer Course","purchased_date":"09 Jan 2024"},{"id":8,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111124240image_402x248-483.png","title":"The Complete 2020 Fullstack Web Developer Course","purchased_date":"29 Dec 2023"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"24 Dec 2023"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"10 Dec 2023"}]}

HomeDataModel homeDataModelFromJson(String str) => HomeDataModel.fromJson(json.decode(str));
String homeDataModelToJson(HomeDataModel data) => json.encode(data.toJson());
class HomeDataModel {
  HomeDataModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  HomeDataModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
HomeDataModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => HomeDataModel(  success: success ?? _success,
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

/// total_student : 7
/// total_course : 3
/// total_earning : "$ 100,00"
/// total_enrollment : 37
/// enroll_stats : {"Jan":2,"Feb":0,"Mar":0,"Apr":0,"May":0,"Jun":0,"Jul":0,"Aug":0,"Sep":0,"Oct":0,"Nov":0,"Dec":0}
/// latest_enrolls : [{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"20 Jan 2024"},{"id":8,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111124240image_402x248-483.png","title":"The Complete 2020 Fullstack Web Developer Course","purchased_date":"09 Jan 2024"},{"id":8,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111124240image_402x248-483.png","title":"The Complete 2020 Fullstack Web Developer Course","purchased_date":"29 Dec 2023"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"24 Dec 2023"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"10 Dec 2023"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? totalStudent, 
      num? totalCourse, 
      String? totalEarning, 
      num? totalEnrollment, 
      Map<dynamic, dynamic>? enrollStats,
      List<LatestEnrolls>? latestEnrolls,}){
    _totalStudent = totalStudent;
    _totalCourse = totalCourse;
    _totalEarning = totalEarning;
    _totalEnrollment = totalEnrollment;
    _enrollStats = enrollStats;
    _latestEnrolls = latestEnrolls;
}

  Data.fromJson(dynamic json) {
    _totalStudent = json['total_student'];
    _totalCourse = json['total_course'];
    _totalEarning = json['total_earning'];
    _totalEnrollment = json['total_enrollment'];
    _enrollStats = json['enroll_stats'];
    if (json['latest_enrolls'] != null) {
      _latestEnrolls = [];
      json['latest_enrolls'].forEach((v) {
        _latestEnrolls?.add(LatestEnrolls.fromJson(v));
      });
    }
  }
  num? _totalStudent;
  num? _totalCourse;
  String? _totalEarning;
  num? _totalEnrollment;
  Map<dynamic, dynamic>? _enrollStats;
  List<LatestEnrolls>? _latestEnrolls;
Data copyWith({  num? totalStudent,
  num? totalCourse,
  String? totalEarning,
  num? totalEnrollment,
  Map<dynamic, dynamic>? enrollStats,
  List<LatestEnrolls>? latestEnrolls,
}) => Data(  totalStudent: totalStudent ?? _totalStudent,
  totalCourse: totalCourse ?? _totalCourse,
  totalEarning: totalEarning ?? _totalEarning,
  totalEnrollment: totalEnrollment ?? _totalEnrollment,
  enrollStats: enrollStats ?? _enrollStats,
  latestEnrolls: latestEnrolls ?? _latestEnrolls,
);
  num? get totalStudent => _totalStudent;
  num? get totalCourse => _totalCourse;
  String? get totalEarning => _totalEarning;
  num? get totalEnrollment => _totalEnrollment;
  Map<dynamic, dynamic>? get enrollStats => _enrollStats;
  List<LatestEnrolls>? get latestEnrolls => _latestEnrolls;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_student'] = _totalStudent;
    map['total_course'] = _totalCourse;
    map['total_earning'] = _totalEarning;
    map['total_enrollment'] = _totalEnrollment;
    if (_enrollStats != null) {
      map['enroll_stats'] = _enrollStats;
    }
    if (_latestEnrolls != null) {
      map['latest_enrolls'] = _latestEnrolls?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// thumbnail : "https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png"
/// title : "Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]"
/// purchased_date : "20 Jan 2024"

LatestEnrolls latestEnrollsFromJson(String str) => LatestEnrolls.fromJson(json.decode(str));
String latestEnrollsToJson(LatestEnrolls data) => json.encode(data.toJson());
class LatestEnrolls {
  LatestEnrolls({
      num? id, 
      String? thumbnail, 
      String? title, 
      String? purchasedDate,}){
    _id = id;
    _thumbnail = thumbnail;
    _title = title;
    _purchasedDate = purchasedDate;
}

  LatestEnrolls.fromJson(dynamic json) {
    _id = json['id'];
    _thumbnail = json['thumbnail'];
    _title = json['title'];
    _purchasedDate = json['purchased_date'];
  }
  num? _id;
  String? _thumbnail;
  String? _title;
  String? _purchasedDate;
LatestEnrolls copyWith({  num? id,
  String? thumbnail,
  String? title,
  String? purchasedDate,
}) => LatestEnrolls(  id: id ?? _id,
  thumbnail: thumbnail ?? _thumbnail,
  title: title ?? _title,
  purchasedDate: purchasedDate ?? _purchasedDate,
);
  num? get id => _id;
  String? get thumbnail => _thumbnail;
  String? get title => _title;
  String? get purchasedDate => _purchasedDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['thumbnail'] = _thumbnail;
    map['title'] = _title;
    map['purchased_date'] = _purchasedDate;
    return map;
  }

}