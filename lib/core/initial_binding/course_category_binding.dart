import 'package:get/get.dart';
import 'package:lms_user_app/controller/course_category_controller.dart';
import 'package:lms_user_app/repository/course_category_repository.dart';

class CourseCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseCategoryController>(() => CourseCategoryController(
        repository: CourseCategoryRepository(apiClient: Get.find())));
  }
}
