import 'package:get/get_connect/http/src/response/response.dart';
import 'package:lms_user_app/utils/app_constants.dart';

import '../data/provider/client_api.dart';

class ExploreRepository {
  final ApiClient apiClient;
  ExploreRepository({required this.apiClient});

  Future<Response?> getExploreData() async {
    return apiClient.getData(AppConstants.explore);
  }
}
