import 'package:get/get.dart';
import 'package:lms_user_app/data/provider/client_api.dart';
import 'package:lms_user_app/utils/app_constants.dart';

class BarchartRepository{
  final ApiClient apiClient;

  BarchartRepository(this.apiClient);

  Future<Response?> getEarningStatisticsByType(String type) async{
    return await apiClient.getData('${AppConstants.earningStatistics}?type=$type');
  }
}