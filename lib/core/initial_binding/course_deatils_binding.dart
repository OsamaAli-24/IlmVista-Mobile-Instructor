import 'package:get/get.dart';
import 'package:lms_user_app/controller/course_detail_controller.dart';
import 'package:lms_user_app/controller/review_controller.dart';
import 'package:lms_user_app/controller/video_player_controller.dart';
import 'package:lms_user_app/repository/course_detail_repo.dart';

class CourseDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CourseDetailController>(() => CourseDetailController(courseDetailsRepository: CourseDetailsRepository(apiClient: Get.find())));
    Get.lazyPut<MyVideoPlayerController>(() => MyVideoPlayerController());
    Get.lazyPut<ReviewController>(()=>ReviewController());
  }

}