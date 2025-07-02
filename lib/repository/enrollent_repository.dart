import 'package:get/get_connect/http/src/response/response.dart';
import 'package:lms_user_app/data/provider/client_api.dart';
import 'package:lms_user_app/utils/app_constants.dart';

class EnrollmentRepository{
  final ApiClient apiClient;

  EnrollmentRepository({required this.apiClient});

  Future<Response?> getEnrollmentsData() async{
    return await apiClient.getData(AppConstants.enrollments);
  }
}