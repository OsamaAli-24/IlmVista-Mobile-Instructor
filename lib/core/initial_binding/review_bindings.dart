import 'package:get/get.dart';
import 'package:lms_user_app/controller/review_controller.dart';

class ReviewBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ReviewController>(() => ReviewController());
  }

}