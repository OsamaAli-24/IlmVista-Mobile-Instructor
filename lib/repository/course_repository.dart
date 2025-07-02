import 'package:get/get_connect/http/src/response/response.dart';
import 'package:lms_user_app/data/provider/client_api.dart';
import 'package:lms_user_app/utils/app_constants.dart';

class CourseRepository{
  final ApiClient apiClient;

  CourseRepository({required this.apiClient});

  Future<Response?> getAllCourses({int page = 0}) async{
    return await apiClient.postData("${AppConstants.instructorCourseList}?page=$page", {});
  }

  Future<Response?> changeCourseStatus({int? id, dynamic body}) async{
    return await apiClient.postData("${AppConstants.changeCourseStatus}$id", body);
  }
}