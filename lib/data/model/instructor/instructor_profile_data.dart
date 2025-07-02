import 'dart:convert';
/// profile_pic : "https://facultytest.spagreen.net/public/images/default/user32x32.jpg"
/// first_name : "Mr."
/// last_name : "Instructor"
/// email : "instructor@spagreen.net"
/// about : "Dedicated, resourceful and goal-driven professional educator with a solid commitment to the social and academic growth and development of every child.An accommodating and\r\n            versatile individual with the talent to develop inspiring hands-on lessons that will capture a child's imagination and breed success. Highly motivated, enthusiastic and dedicated educator\r\n            who wants all children to be successful learners.\r\n            Committed to creating a classroom atmosphere that is stimulating and encouraging to students. Aptitude to remain flexible, ensuring that every child's learning styles and abilities are\r\n            addressed.Superior interpersonal and communication skills to foster meaningful relationships with students, staff and parents Demonstrated ability to consistently individualize instruction, based on student's needs and interests\r\n            Exceptional ability to establish cooperative, professional relationships with parents, staff and administration.\r\n            Professional Educator with diverse experience and strong track record fostering child-centered curriculum and student creativity.\r\n            Warm and caring teacher who wants all children to be successful learners and works to create a classroom atmosphere that is stimulating, encouraging, and adaptive to the varied needs of students."
/// phone : "01711111254"
/// designation : "Professional Graphic & UX Designer"
/// organization_name : null
/// social_links : []
/// expertises : []
/// website : null
/// address : "Dhaka, Bangladesh"
/// total_course : 2
/// total_student : 0
/// followers : 0
/// followings : 0

InstructorProfileData instructorProfileDataFromJson(String str) => InstructorProfileData.fromJson(json.decode(str));
String instructorProfileDataToJson(InstructorProfileData data) => json.encode(data.toJson());
class InstructorProfileData {
  InstructorProfileData({
      String? profilePic, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? about, 
      String? phone, 
      String? designation, 
      dynamic organizationName, 
      List<SocialLinks>? socialLinks,
      List<dynamic>? expertises, 
      dynamic website, 
      String? address, 
      num? totalCourse, 
      num? totalStudent, 
      num? followers, 
      num? followings,}){
    _profilePic = profilePic;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _about = about;
    _phone = phone;
    _designation = designation;
    _organizationName = organizationName;
    _socialLinks = socialLinks;
    _expertises = expertises;
    _website = website;
    _address = address;
    _totalCourse = totalCourse;
    _totalStudent = totalStudent;
    _followers = followers;
    _followings = followings;
}

  InstructorProfileData.fromJson(dynamic json) {
    _profilePic = json['profile_pic'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _about = json['about'];
    _phone = json['phone'];
    _designation = json['designation'];
    _organizationName = json['organization_name'];
    if (json['social_links'] != null) {
      _socialLinks = [];
      json['social_links'].forEach((v) {
        _socialLinks?.add(SocialLinks.fromJson(v));
        // _socialLinks?.add(v);
      });
    }
    if (json['expertises'] != null) {
      _expertises = [];
      json['expertises'].forEach((v) {
        // _expertises?.add(Dynamic.fromJson(v));
        _expertises?.add(v);
      });
    }
    _website = json['website'];
    _address = json['address'];
    _totalCourse = json['total_course'];
    _totalStudent = json['total_student'];
    _followers = json['followers'];
    _followings = json['followings'];
  }
  String? _profilePic;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _about;
  String? _phone;
  String? _designation;
  dynamic _organizationName;
  List<SocialLinks>? _socialLinks;
  List<dynamic>? _expertises;
  dynamic _website;
  String? _address;
  num? _totalCourse;
  num? _totalStudent;
  num? _followers;
  num? _followings;
InstructorProfileData copyWith({  String? profilePic,
  String? firstName,
  String? lastName,
  String? email,
  String? about,
  String? phone,
  String? designation,
  dynamic organizationName,
  List<SocialLinks>? socialLinks,
  List<dynamic>? expertises,
  dynamic website,
  String? address,
  num? totalCourse,
  num? totalStudent,
  num? followers,
  num? followings,
}) => InstructorProfileData(  profilePic: profilePic ?? _profilePic,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  about: about ?? _about,
  phone: phone ?? _phone,
  designation: designation ?? _designation,
  organizationName: organizationName ?? _organizationName,
  socialLinks: socialLinks ?? _socialLinks,
  expertises: expertises ?? _expertises,
  website: website ?? _website,
  address: address ?? _address,
  totalCourse: totalCourse ?? _totalCourse,
  totalStudent: totalStudent ?? _totalStudent,
  followers: followers ?? _followers,
  followings: followings ?? _followings,
);
  String? get profilePic => _profilePic;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get about => _about;
  String? get phone => _phone;
  String? get designation => _designation;
  dynamic get organizationName => _organizationName;
  List<SocialLinks>? get socialLinks => _socialLinks;
  List<dynamic>? get expertises => _expertises;
  dynamic get website => _website;
  String? get address => _address;
  num? get totalCourse => _totalCourse;
  num? get totalStudent => _totalStudent;
  num? get followers => _followers;
  num? get followings => _followings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_pic'] = _profilePic;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['about'] = _about;
    map['phone'] = _phone;
    map['designation'] = _designation;
    map['organization_name'] = _organizationName;
    if (_socialLinks != null) {
      map['social_links'] = _socialLinks?.map((v) => v.toJson()).toList();
    }
    if (_expertises != null) {
      map['expertises'] = _expertises?.map((v) => v.toJson()).toList();
    }
    map['website'] = _website;
    map['address'] = _address;
    map['total_course'] = _totalCourse;
    map['total_student'] = _totalStudent;
    map['followers'] = _followers;
    map['followings'] = _followings;
    return map;
  }

}

SocialLinks socialLinksFromJson(String str) => SocialLinks.fromJson(json.decode(str));
String socialLinksToJson(SocialLinks data) => json.encode(data.toJson());
class SocialLinks {
  SocialLinks({
    String? name,
    String? link,}){
    _name = name;
    _link = link;
  }

  SocialLinks.fromJson(dynamic json) {
    _name = json['name'];
    _link = json['link'];
  }
  String? _name;
  String? _link;
  SocialLinks copyWith({  String? name,
    String? link,
  }) => SocialLinks(  name: name ?? _name,
    link: link ?? _link,
  );
  String? get name => _name;
  String? get link => _link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['link'] = _link;
    return map;
  }

}