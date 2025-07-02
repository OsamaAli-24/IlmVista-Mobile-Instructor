import 'package:get/get.dart';
import 'package:lms_user_app/controller/review_controller.dart';
import 'package:lms_user_app/data/model/course_detail/course_detail.dart';
import 'package:lms_user_app/repository/course_detail_repo.dart';
import 'package:lms_user_app/utils/dev_util.dart';

import '../components/custom_snackbar.dart';

class CourseDetailController extends GetxController implements GetxService {
  final CourseDetailsRepository courseDetailsRepository;
  CourseDetailController({required this.courseDetailsRepository});
  late CourseDetail _courseDetail;
  CourseDetail get courseDetail => _courseDetail;
  bool isLoading = false;

  final ReviewController reviewController = Get.find();

  Future<void> getCourseDetail({required int id}) async {
    isLoading = true;
    update();
    final response = await courseDetailsRepository.getCourseDetail(id: id);

    appLog(tag: "CourseDetails Response", msg: response?.bodyString ?? response);

    if (response != null && response.statusCode == 200) {
      if (response.body['success'] == true) {
        CourseDetail detail = CourseDetail.fromJson(response.body);
        _courseDetail = detail;
      } else {
        customSnackBar(response.body['message']);
      }
    } else {
      customSnackBar(response?.body['message'] ?? "something_wrong".tr);
    }
    isLoading = false;
    update();
  }

  bool isSelect = false;
  curriculumButton() {
    isSelect = !isSelect;
    update();
  }
}
