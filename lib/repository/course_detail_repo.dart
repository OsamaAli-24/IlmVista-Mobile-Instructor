import '../data/provider/client_api.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../utils/app_constants.dart';

class CourseDetailsRepository {
  final ApiClient apiClient;
  CourseDetailsRepository({required this.apiClient});

  Future<Response?> getCourseDetail({required int id}) async {
    return apiClient.getData("${AppConstants.courseDetails}$id");
  }
}
