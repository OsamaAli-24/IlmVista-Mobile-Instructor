import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_snackbar.dart';
import 'package:lms_user_app/data/model/enrollment/enrollment_data_model.dart';
import 'package:lms_user_app/data/model/home_data_model/home_data_model.dart';
import 'package:lms_user_app/repository/enrollent_repository.dart';
import 'package:lms_user_app/utils/dev_util.dart';

class EnrollmentController extends GetxController{
  final EnrollmentRepository repository;

  EnrollmentController({required this.repository});


  bool isLoading = false;
  List<LatestEnrolls>? _enrollmentData;
  List<LatestEnrolls>? get enrollmentData => _enrollmentData;

  Future<void> getEnrollmentsData() async {
    isLoading = true;
    update();
    final response = await repository.getEnrollmentsData();

    appLog(tag: "Enrollment Response", msg: response?.bodyString ?? response);

    if (response != null && response.statusCode == 200) {
      if (response.body['success'] == true) {
        EnrollmentDataModel enrollmentDataModel = EnrollmentDataModel.fromJson(response.body);
        _enrollmentData = enrollmentDataModel.data?.enrollments ?? [];
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