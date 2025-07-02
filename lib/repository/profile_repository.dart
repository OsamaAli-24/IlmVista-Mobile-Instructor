import 'package:get/get.dart';
import 'package:lms_user_app/data/provider/client_api.dart';
import 'package:lms_user_app/utils/app_constants.dart';

class ProfileRepository{
  final ApiClient apiClient;

  ProfileRepository({required this.apiClient});

  //---------------------------------------------change instructor profile
  Future<Response?> changeInstructorProfile(dynamic data) async{
    return await apiClient.postData(AppConstants.updateInstructorProfile, data);
  }
}