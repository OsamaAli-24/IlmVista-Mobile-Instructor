import 'dart:convert';
/// success : true
/// message : "stat_fetched_successfully"
/// data : {"Jan":2,"Feb":0,"Mar":0,"Apr":0,"May":0,"Jun":0,"Jul":0,"Aug":0,"Sep":0,"Oct":0,"Nov":0,"Dec":0}

BarchartDataModel barchartDataModelFromJson(String str) => BarchartDataModel.fromJson(json.decode(str));
String barchartDataModelToJson(BarchartDataModel data) => json.encode(data.toJson());
class BarchartDataModel {
  BarchartDataModel({
      bool? success, 
      String? message, 
      dynamic data,}){
    _success = success;
    _message = message;
    _data = data;
}

  BarchartDataModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'];
  }
  bool? _success;
  String? _message;
  dynamic _data;
BarchartDataModel copyWith({  bool? success,
  String? message,
  dynamic data,
}) => BarchartDataModel(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  dynamic get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }

}