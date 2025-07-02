import 'package:get/get.dart';
import 'package:lms_user_app/controller/settings_controller.dart';

class SettingsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(()=>SettingsController());
  }

}