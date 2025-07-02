import 'dart:convert';
/// success : true
/// message : "Student fetched successfully"
/// data : {"id":3,"name":"Daniels Mir Jone Jonejh","email":"student@spagreen.net","address":"941 Sammie Fort Suite 078West Benjamin, IA 24385-1704","image":"https://faculty.spagreen.net/demo/public/images/20240209083047image_40X40_staff_138.jpg"}

StudentProfile studentProfileFromJson(String str) => StudentProfile.fromJson(json.decode(str));
String studentProfileToJson(StudentProfile data) => json.encode(data.toJson());
class StudentProfile {
  StudentProfile({
      bool? success, 
      String? message, 
      Data? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  StudentProfile.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  String? _message;
  Data? _data;
StudentProfile copyWith({  bool? success,
  String? message,
  Data? data,
}) => StudentProfile(  success: success ?? _success,
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

/// id : 3
/// name : "Daniels Mir Jone Jonejh"
/// email : "student@spagreen.net"
/// address : "941 Sammie Fort Suite 078West Benjamin, IA 24385-1704"
/// image : "https://faculty.spagreen.net/demo/public/images/20240209083047image_40X40_staff_138.jpg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? id, 
      String? name, 
      String? email, 
      String? address, 
      String? image,}){
    _id = id;
    _name = name;
    _email = email;
    _address = address;
    _image = image;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _address = json['address'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _address;
  String? _image;
Data copyWith({  num? id,
  String? name,
  String? email,
  String? address,
  String? image,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  address: address ?? _address,
  image: image ?? _image,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get address => _address;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['address'] = _address;
    map['image'] = _image;
    return map;
  }

}