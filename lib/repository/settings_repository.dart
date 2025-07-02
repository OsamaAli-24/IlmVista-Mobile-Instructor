import 'package:get/get.dart';
import 'package:lms_user_app/data/provider/client_api.dart';
import 'package:lms_user_app/utils/app_constants.dart';

class SettingsRepository{
  final ApiClient apiClient;

  SettingsRepository({required this.apiClient});

  //---------------------------------------------------delete account
  Future<Response?> deleteAccount() async{
    return await apiClient.getData(AppConstants.deleteUserAccount);
  }


}