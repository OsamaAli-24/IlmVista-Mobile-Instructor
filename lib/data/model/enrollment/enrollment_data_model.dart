import 'dart:convert';

import 'package:lms_user_app/data/model/home_data_model/home_data_model.dart';
/// success : true
/// message : "enrollments_fetched_successfully"
/// data : {"enrollments":[{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"20 Jan 2024"},{"id":8,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111124240image_402x248-483.png","title":"The Complete 2020 Fullstack Web Developer Course","purchased_date":"09 Jan 2024"},{"id":8,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111124240image_402x248-483.png","title":"The Complete 2020 Fullstack Web Developer Course","purchased_date":"29 Dec 2023"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"24 Dec 2023"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"10 Dec 2023"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"23 Nov 2023"},{"id":8,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111124240image_402x248-483.png","title":"The Complete 2020 Fullstack Web Developer Course","purchased_date":"21 Nov 2023"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"14 Feb 2024"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"14 Feb 2024"},{"id":30,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111133421image_402x248-264.png","title":"Mobile games","purchased_date":"14 Feb 2024"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"14 Feb 2024"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"14 Feb 2024"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"14 Feb 2024"},{"id":30,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111133421image_402x248-264.png","title":"Mobile games","purchased_date":"14 Feb 2024"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"14 Feb 2024"}]}

EnrollmentDataModel enrollmentDataModelFromJson(String str) => EnrollmentDataModel.fromJson(json.decode(str));
String enrollmentDataModelToJson(EnrollmentDataModel data) => json.encode(data.toJson());
class EnrollmentDataModel {
  EnrollmentDataModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  EnrollmentDataModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
EnrollmentDataModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => EnrollmentDataModel(  success: success ?? _success,
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

/// enrollments : [{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"20 Jan 2024"},{"id":8,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111124240image_402x248-483.png","title":"The Complete 2020 Fullstack Web Developer Course","purchased_date":"09 Jan 2024"},{"id":8,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111124240image_402x248-483.png","title":"The Complete 2020 Fullstack Web Developer Course","purchased_date":"29 Dec 2023"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"24 Dec 2023"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"10 Dec 2023"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"23 Nov 2023"},{"id":8,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111124240image_402x248-483.png","title":"The Complete 2020 Fullstack Web Developer Course","purchased_date":"21 Nov 2023"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"14 Feb 2024"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"14 Feb 2024"},{"id":30,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111133421image_402x248-264.png","title":"Mobile games","purchased_date":"14 Feb 2024"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"14 Feb 2024"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"14 Feb 2024"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"14 Feb 2024"},{"id":30,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231111133421image_402x248-264.png","title":"Mobile games","purchased_date":"14 Feb 2024"},{"id":2,"thumbnail":"https://faculty.spagreen.net/demo/public/images/20231101021332image_402x248-265.png","title":"Machine Learning A-Z™: AI, Python & R + ChatGPT Bonus [2023]","purchased_date":"14 Feb 2024"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<LatestEnrolls>? enrollments,}){
    _enrollments = enrollments;
}

  Data.fromJson(dynamic json) {
    if (json['enrollments'] != null) {
      _enrollments = [];
      json['enrollments'].forEach((v) {
        _enrollments?.add(LatestEnrolls.fromJson(v));
      });
    }
  }
  List<LatestEnrolls>? _enrollments;
Data copyWith({  List<LatestEnrolls>? enrollments,
}) => Data(  enrollments: enrollments ?? _enrollments,
);
  List<LatestEnrolls>? get enrollments => _enrollments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_enrollments != null) {
      map['enrollments'] = _enrollments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}