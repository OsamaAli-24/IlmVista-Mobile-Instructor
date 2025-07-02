import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/controller/auth_controller.dart';
import 'package:lms_user_app/controller/localization_controller.dart';
import 'package:lms_user_app/controller/splash_controller.dart';
import 'package:lms_user_app/controller/theme_controller.dart';
import 'package:lms_user_app/controller/user_controller.dart';
import 'package:lms_user_app/data/model/response/language_model.dart';
import 'package:lms_user_app/data/provider/client_api.dart';
import 'package:lms_user_app/repository/auth_repo.dart';
import 'package:lms_user_app/repository/splash_repo.dart';
import 'package:lms_user_app/repository/user_repo.dart';
import 'package:lms_user_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<Map<String, Map<String, String>>> init() async {
  //those binding are used before called GetMaterial app
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(() => SplashController(splashRepo: SplashRepo(apiClient: Get.find(), sharedPreferences: Get.find())));
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find(), apiClient: Get.find()));
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: AuthRepo(sharedPreferences:Get.find(),apiClient: Get.find())));
  Get.lazyPut(() => UserController(userRepo: UserRepo(apiClient: Get.find())));

  // Retrieving localized data
  Map<String, Map<String, String>> _languages = Map();
  for(LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues =  await rootBundle.loadString('assets/languages/${languageModel.languageCode}.json');
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();
    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _languages['${languageModel.languageCode}_${languageModel.countryCode}'] = _json;
  }
  return _languages;
}