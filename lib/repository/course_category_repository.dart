import 'package:get/get.dart';
import 'package:lms_user_app/data/provider/client_api.dart';
import 'package:lms_user_app/utils/app_constants.dart';

class CourseCategoryRepository{
  final ApiClient apiClient;

  CourseCategoryRepository({required this.apiClient});

  //-------------------------------------------------get course categories
  Future<Response?> getCourseCategories() async{
    return await apiClient.getData(AppConstants.categories);
  }

  //--------------------------------------------------get course by categories
  Future<Response?> getCourseByCategory({required String category}) async{
    return await apiClient.getData(AppConstants.courseByCategory+category);
  }
}