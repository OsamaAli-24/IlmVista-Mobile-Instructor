import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms_user_app/components/custom_snackbar.dart';
import 'package:lms_user_app/core/helper/help_me.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/data/model/response_model.dart';
import 'package:lms_user_app/data/model/user_info_model.dart';
import 'package:lms_user_app/data/provider/checker_api.dart';
import 'package:lms_user_app/repository/user_repo.dart';
import 'auth_controller.dart';
import 'cart_controller.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  UserInfoModel _userInfoModel = UserInfoModel();
  XFile? _pickedFile ;
  FilePickerResult? _selectedFile;
  bool _isLoading = false;

  UserInfoModel get userInfoModel => _userInfoModel;
  XFile? get pickedFile => _pickedFile;
  bool get isLoading => _isLoading;
  int _year = 0;
  int get year => _year;

  int _month = 0;
  int get month => _month;

  int _day = 0;
  int get day => _day;
  final now = DateTime.now();
  String _createdAccountAgo ='';
  String get createdAccountAgo => _createdAccountAgo;

  String _userProfileImage = '';
  String get userProfileImage => _userProfileImage;

  Future<void> getUserInfo() async {
    _isLoading = true;
    Response response = await userRepo.getUserInfo();
    if (response.statusCode == 200) {
      _userInfoModel = UserInfoModel.fromJson(response.body['content']);
      _userProfileImage = _userInfoModel.image!;
      printLog(_createdAccountAgo);
    } else {
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
  }

  Future<ResponseModel> changePassword(UserInfoModel updatedUserModel) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;
    Response response = await userRepo.changePassword(updatedUserModel);
    if (response.statusCode == 200) {
      String message = response.body["message"];
      _responseModel = ResponseModel(true, message);
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text(response.body['message']),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      ));
    } else {
      _responseModel = ResponseModel(false, response.statusText);
    }
    _isLoading = false;
    update();
    return _responseModel;
  }

  void pickImage() async {
    _pickedFile = (await ImagePicker().pickImage(source: ImageSource.gallery))!;
    update();
  }


  void pickFile() async {
    _selectedFile = (await FilePicker.platform.pickFiles())!;
    print(_selectedFile!.files.single.name);
    update();
  }

  void initData() {
  }

  Future removeUser() async {
    _isLoading = true;
    update();
    Response response = await userRepo.deleteUser();
    _isLoading = false;
    if(response.statusCode == 200){
      customSnackBar('your_account_remove_successfully'.tr);
      Get.find<AuthController>().clearSharedData();
      Get.find<CartController>().clearCartList();
      Get.offAllNamed(RouteHelper.getSignInRoute(RouteHelper.splash));
    }else{
      Get.back();
      ApiChecker.checkApi(response);
    }
  }
}