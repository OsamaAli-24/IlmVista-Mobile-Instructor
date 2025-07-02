import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_snackbar.dart';
import 'package:lms_user_app/controller/course_controller.dart';
import 'package:lms_user_app/repository/course_repository.dart';
import 'package:lms_user_app/utils/dev_util.dart';

class CourseCardController extends GetxController {
  final CourseRepository _repository = CourseRepository(apiClient: Get.find());

  final _status = RxnString(null);
  String? get status => _status.value;

  final _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;

  final _isActive = RxnBool(null);
  bool? get isActive => _isActive.value;

  final _selectedId = RxInt(-1);
  int get selectedId => _selectedId.value;

  Future<void> changeCourseStatus(int? id, Map body) async {
    appLog(tag: "Body", msg: body);
    _isLoading.value = true;

    _isActive.value = body['is_published'];

    _selectedId.value = id ?? -1;
    Get.dialog(const Center(child: CircularProgressIndicator(),));

    await _repository.changeCourseStatus(id: id, body: body).then((value) {
      update();

      appLog(tag: "Status Response", msg: value?.bodyString ?? value);

      if (value != null && value.statusCode == 200) {
        _isLoading.value = false;

        if (value.body['success'] == true) {
          _status.value = isActive == true ? 'Active' : 'Inactive';
          Navigator.pop(Get.context!);
          Get.find<CourseController>().getInstructorCourseList();
          update();
        }else{
          customSnackBar(value.body['success']);
          Navigator.pop(Get.context!);
        }
      }else{
        customSnackBar(value?.body['success']);
        Navigator.pop(Get.context!);
      }
    }).onError((error, stackTrace) {
      _isLoading.value = false;
      appLog(tag: "Status Error", msg: error);
    });

    update();
  }

  void updateStatus(String? status) {
    _status.value = status;
  }
}
