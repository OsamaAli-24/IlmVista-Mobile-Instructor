import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_snackbar.dart';
import 'package:lms_user_app/repository/settings_repository.dart';
import 'package:lms_user_app/utils/dev_util.dart';

class SettingsController extends GetxController{
  final SettingsRepository _repository = SettingsRepository(apiClient: Get.find());

  bool isDeleted = false;
  bool isLoading = false;

  Future<void> deleteUserAccount() async {
    isLoading = true;
    update();
    final response = await _repository.deleteAccount();

    appLog(tag: "Delete Account Response", msg: response?.bodyString ?? response);

    if (response != null && response.statusCode == 200) {
      if (response.body['success'] == true) {
        isDeleted = true;
      } else {
        customSnackBar(response.body['message']);
      }
    } else {
      customSnackBar(response?.body['message'] ?? 'something_wrong'.tr);
    }
    isLoading = false;
    update();
  }
}