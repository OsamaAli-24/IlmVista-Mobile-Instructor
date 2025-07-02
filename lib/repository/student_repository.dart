import 'package:get/get.dart';
import 'package:lms_user_app/data/provider/client_api.dart';
import 'package:lms_user_app/utils/app_constants.dart';

class StudentRepository{
  final ApiClient apiClient;

  StudentRepository({required this.apiClient});

  //----------------------------------------------get student list
  Future<Response?> getStudentList() async{
    return await apiClient.getData(AppConstants.instructorStudentList);
  }

  //--------------------------------------------- get student profile
  Future<Response?> getStudentProfile(int id) async{
    return await apiClient.getData("${AppConstants.studentProfile}$id");
  }
  
  //--------------------------------------------- get student course list
  Future<Response?> getStudentCourseList(int id) async{
    return await apiClient.getData("${AppConstants.studentCourses}$id");
  }

  //--------------------------------------------- get student following list
  Future<Response?> getStudentFollowingList(int id) async{
    return await apiClient.getData("${AppConstants.studentFollowings}$id");
  }
}