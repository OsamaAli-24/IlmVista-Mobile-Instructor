import 'package:get/get.dart';

import '../data/provider/client_api.dart';
import '../utils/app_constants.dart';

class HomeRepository {
  final ApiClient apiClient;
  HomeRepository({required this.apiClient}){
    apiClient.initApiClient();
  }

  Future<Response?> getHomeData() async {
    return apiClient.getData(AppConstants.instructorDashboard);
  }

  Future<Response?> getLatestCourse(int page) async {
    return apiClient.getData("${AppConstants.latestCourse}?page=$page");
  }
}
