import 'dart:io';

class ChangeProfileDataModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? designation;
  final String? organization;
  final String? gender;
  final String? dateOfBirth;
  final String? webSite;
  final String? address;
  final String? expertises0;
  final String? expertises1;
  final String? facebook;
  final String? twitter;
  final String? instagram;
  final String? linkedin;
  final String? youtube;
  final File? image;
  final String? about;

  ChangeProfileDataModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.designation,
      required this.organization,
      required this.gender,
      required this.dateOfBirth,
      required this.address,
      this.expertises0,
      this.expertises1,
      this.facebook,
      this.twitter,
      this.instagram,
      this.linkedin,
      this.youtube,
      this.webSite,
      this.image,
      this.about,});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['designation'] = designation;
    data['expertises[]'] = expertises0;
    data['expertises[]'] = expertises1;
    data['website'] = webSite;
    data['address'] = address;
    data['social_links[facebook]'] = facebook;
    data['social_links[twitter]'] = twitter;
    data['social_links[instagram]'] = instagram;
    data['social_links[linkedin]'] = linkedin;
    data['social_links[youtube]'] = youtube;
    data['image'] = image;
    data['about'] = about;

    return data;
  }
}

class Expertises {
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    return data;
  }
}
