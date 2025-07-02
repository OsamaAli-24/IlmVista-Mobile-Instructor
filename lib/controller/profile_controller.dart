import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms_user_app/components/custom_snackbar.dart';
import 'package:lms_user_app/controller/instructor_controller.dart';
import 'package:lms_user_app/core/helper/help_me.dart';
import 'package:lms_user_app/data/model/instructor/Instructor_profile_data.dart';
import 'package:lms_user_app/data/model/profile/change_profile_data_model.dart';
import 'package:lms_user_app/repository/profile_repository.dart';
import 'package:lms_user_app/utils/dev_util.dart';
import 'package:lms_user_app/utils/messages.dart';

class ProfileController extends GetxController {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var designationController = TextEditingController();
  var organizationController = TextEditingController();
  var addressController = TextEditingController();
  var facebookController = TextEditingController();
  var twitterController = TextEditingController();
  var instagramController = TextEditingController();
  var linkedinController = TextEditingController();

  final ProfileRepository _repository = ProfileRepository(apiClient: Get.find());

  late InstructorProfileData? profile = Get.arguments;

  final bool _isLoading = false;

  bool get isLoading => _isLoading;

  final List genderList = ["Male", "Female"];
  final _selectGender = RxnString();
  String? get selectedGender => _selectGender.value;

  File? logo;
  File? banner;
  File? shopBanner;
  File? taxPaper;
  late String imagePath;
  final _picker = ImagePicker();
  Future<void> getImage(String? images) async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 20);
    if (images == "logo") {
      if (pickedFile != null) {
        logo = File(pickedFile.path);
        imagePath = pickedFile.path;
        printLog(imagePath);
        update();
      } else {
        printLog('No image selected.');
      }
    } else if (images == "banner") {
      if (pickedFile != null) {
        banner = File(pickedFile.path);
        imagePath = pickedFile.path;
        //printLog(imagePath);
        update();
      } else {
        printLog('No image selected.');
      }
    } else if (images == "shop_banner") {
      if (pickedFile != null) {
        shopBanner = File(pickedFile.path);
        imagePath = pickedFile.path;
        printLog(imagePath);
        update();
      } else {
        printLog('No image selected.');
      }
    } else if (images == "tex_paper") {
      if (pickedFile != null) {
        taxPaper = File(pickedFile.path);
        imagePath = pickedFile.path;
        //printLog(imagePath);
        update();
      } else {
        printLog('No image selected.');
      }
    }
  }

  //------------------------------------------------------change profile data
  Future<void> changeProfileData() async{
    Map profileDataModel = ChangeProfileDataModel(
        firstName: _getText(firstNameController),
        lastName: _getText(lastNameController),
        email: _getText(emailController),
        phone: _getText(phoneController),
        designation: _getText(designationController),
        organization: _getText(organizationController),
        gender: selectedGender,
        dateOfBirth: 'dateOfBirth',
        address: _getText(addressController),
        expertises0:  '1',
        expertises1:  '2',
        facebook: _getText(facebookController),
        twitter: _getText(twitterController),
        instagram: _getText(instagramController),
        linkedin: _getText(linkedinController),
        youtube: '',
      about: 'About me'
    ).toJson();

    final response = await _repository.changeInstructorProfile(profileDataModel);

    if(response != null && response.statusCode == 200){
      if(response.body['success'] == true){
        Get.snackbar('Profile', 'updated Successfully');
        Get.find<InstructorController>().getInstructorProfile(0);
      }else{
        customSnackBar(response.body['message']);
      }
    }else{
      customSnackBar('Failed to update or server issue');
    }

    appLog(tag: "Change Profile Data", msg: response?.bodyString ?? response);
  }

  //-----------------------------------------------------update selected gender
  void updateGender(String? gender) {
    _selectGender.value = gender;
  }

  //----------------------------------------------------- get text from text controller
  String? _getText(TextEditingController textEditingController) =>
      textEditingController.text.toString().trim();

  @override
  void onReady() {

    firstNameController.text = profile?.firstName ?? '';
    lastNameController.text = profile?.lastName ?? '';
    emailController.text = profile?.email ?? '';
    phoneController.text = profile?.phone ?? '';
    addressController.text = profile?.address ?? '';
    organizationController.text = profile?.organizationName ?? '';
    designationController.text = profile?.designation ?? '';
    organizationController.text = profile?.organizationName ?? '';
    facebookController.text = profile?.socialLinks?[0].link ?? '';
    twitterController.text = profile?.socialLinks?[1].link ?? '';
    instagramController.text = profile?.socialLinks?[2].link ?? '';
    linkedinController.text = profile?.socialLinks?[3].link ?? '';

    super.onReady();
  }
}
