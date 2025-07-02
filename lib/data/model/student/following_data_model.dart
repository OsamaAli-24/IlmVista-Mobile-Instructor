import 'dart:convert';
/// success : true
/// message : "following_fetched_successfully"
/// data : {"following":[{"id":2,"name":"Tanvir edit Ahmed edit","image":"https://faculty.spagreen.net/demo/public/images/20240219095321image_40X40-user-54.png","designation":"web developer"},{"id":14,"name":"Denis fron","image":"https://faculty.spagreen.net/demo/public/images/20231118073513image_40X40-user-363.jpg","designation":"Associate Lecturer"},{"id":16,"name":"kofras namroe","image":"https://faculty.spagreen.net/demo/public/images/20231118073538image_40X40-user-112.jpg","designation":"Assistant Lecturar"}]}

FollowingDataModel followingDataModelFromJson(String str) => FollowingDataModel.fromJson(json.decode(str));
String followingDataModelToJson(FollowingDataModel data) => json.encode(data.toJson());
class FollowingDataModel {
  FollowingDataModel({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  FollowingDataModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
FollowingDataModel copyWith({  bool? success,
  String? message,
  Data? data,
}) => FollowingDataModel(  success: success ?? _success,
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

/// following : [{"id":2,"name":"Tanvir edit Ahmed edit","image":"https://faculty.spagreen.net/demo/public/images/20240219095321image_40X40-user-54.png","designation":"web developer"},{"id":14,"name":"Denis fron","image":"https://faculty.spagreen.net/demo/public/images/20231118073513image_40X40-user-363.jpg","designation":"Associate Lecturer"},{"id":16,"name":"kofras namroe","image":"https://faculty.spagreen.net/demo/public/images/20231118073538image_40X40-user-112.jpg","designation":"Assistant Lecturar"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<Following>? following,}){
    _following = following;
}

  Data.fromJson(dynamic json) {
    if (json['following'] != null) {
      _following = [];
      json['following'].forEach((v) {
        _following?.add(Following.fromJson(v));
      });
    }
  }
  List<Following>? _following;
Data copyWith({  List<Following>? following,
}) => Data(  following: following ?? _following,
);
  List<Following>? get following => _following;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_following != null) {
      map['following'] = _following?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// name : "Tanvir edit Ahmed edit"
/// image : "https://faculty.spagreen.net/demo/public/images/20240219095321image_40X40-user-54.png"
/// designation : "web developer"

Following followingFromJson(String str) => Following.fromJson(json.decode(str));
String followingToJson(Following data) => json.encode(data.toJson());
class Following {
  Following({
      num? id, 
      String? name, 
      String? image, 
      String? designation,}){
    _id = id;
    _name = name;
    _image = image;
    _designation = designation;
}

  Following.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _designation = json['designation'];
  }
  num? _id;
  String? _name;
  String? _image;
  String? _designation;
Following copyWith({  num? id,
  String? name,
  String? image,
  String? designation,
}) => Following(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  designation: designation ?? _designation,
);
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  String? get designation => _designation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['designation'] = _designation;
    return map;
  }

}