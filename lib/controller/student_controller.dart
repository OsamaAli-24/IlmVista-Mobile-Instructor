import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_snackbar.dart';
import 'package:lms_user_app/data/model/instructor/instructor_student_list/instructor_student_list.dart';
import 'package:lms_user_app/data/model/instructor/instructor_student_list/student.dart';
import 'package:lms_user_app/data/model/student/following_data_model.dart';
import 'package:lms_user_app/data/model/student/student_course_data_model.dart';
import 'package:lms_user_app/data/model/student/student_profile.dart';
import 'package:lms_user_app/repository/student_repository.dart';
import 'package:lms_user_app/utils/dev_util.dart';

class StudentController extends GetxController {
  final state = StudentState();

  //--------------------------------------------------------on ready
  @override
  void onReady() async{
    await state.getStudentList();
    super.onReady();

    appLog(tag: "Controller", msg: 'Student controller created');
  }
}

class StudentState{
  final StudentRepository _repository =
  StudentRepository(apiClient: Get.find());

  //student list
  final _studentList = RxList<Student>();
  List<Student> get studentList => _studentList;

  //is student loaded
  final _isStudentListLoading = RxBool(false);
  bool get isStudentListLoading => _isStudentListLoading.value;

  //student profile
  final _isProfileNotLoaded = RxBool(false);
  bool get isProfileNotLoaded => _isProfileNotLoaded.value;

  final _studentProfile = Rx<StudentProfile>(StudentProfile());
  StudentProfile get studentProfile => _studentProfile.value;

  //student courses
  final _isStudentCoursesNotLoaded = RxBool(false);
  bool get isStudentCoursesNotLoaded => _isStudentCoursesNotLoaded.value;
  final _studentCourses = RxList<StudentCoursesData>();
  List<StudentCoursesData> get studentCourses => _studentCourses;

  //student followings
  final _isStudentFollowingNotLoaded = RxBool(false);
  bool get isStudentFollowingNotLoaded => _isStudentFollowingNotLoaded.value;
  final _studentFollowing = RxList<Following>();
  List<Following> get studentFollowing => _studentFollowing;

  //--------------------------------------------------- get student list data
  Future<void> getStudentList() async {
    _isStudentListLoading.value = true;

    final response = await _repository.getStudentList();
    appLog(tag: "StudentList Response", msg: response?.bodyString ?? response);

    if (response != null && response.statusCode == 200) {
      if (response.body['success'] == true) {
        InstructorStudentList student =
        InstructorStudentList.fromJson(response.body);
        _studentList.value = student.data?.students ?? [];
        _isStudentListLoading.value = false;
      } else {
        _isStudentListLoading.value = false;
        customSnackBar(response.body['message']);
      }
    } else {
      _isStudentListLoading.value = false;
      customSnackBar(response?.body['message'] ?? 'something_wrong'.tr);
    }
  }

  //------------------------------------------------ get student profile
  Future<void> getStudentProfile(int id) async {
    _isProfileNotLoaded.value = true;

    final response = await _repository.getStudentProfile(id);
    appLog(tag: "StudentProfile Response", msg: response?.bodyString ?? response);

    if (response != null && response.statusCode == 200) {
      if (response.body['success'] == true) {
        StudentProfile profile =
        StudentProfile.fromJson(response.body);
        _studentProfile.value = profile;
        _isProfileNotLoaded.value = false;
      } else {
        _isProfileNotLoaded.value = false;
        customSnackBar(response.body['message']);
      }
    } else {
      _isProfileNotLoaded.value = false;
      customSnackBar(response?.body['message'] ?? 'something_wrong'.tr);
    }
  }

  //--------------------------------------------------- get student courses list data
  Future<void> getStudentCoursesList(int id) async {
    _isStudentCoursesNotLoaded.value = true;

    final response = await _repository.getStudentCourseList(id);
    appLog(tag: "StudentCourses Response", msg: response?.bodyString ?? response);

    if (response != null && response.statusCode == 200) {
      if (response.body['success'] == true) {
        StudentCourseDataModel data =
        StudentCourseDataModel.fromJson(response.body);
        _studentCourses.value = data.data?.courses ?? [];
        _isStudentCoursesNotLoaded.value = false;
      } else {
        _isStudentCoursesNotLoaded.value = false;
        customSnackBar(response.body['message']);
      }
    } else {
      _isStudentCoursesNotLoaded.value = false;
      customSnackBar(response?.body['message'] ?? 'something_wrong'.tr);
    }
  }

  //--------------------------------------------------- get student courses list data
  Future<void> getStudentFollowingList(int id) async {
    _isStudentFollowingNotLoaded.value = true;

    final response = await _repository.getStudentFollowingList(id);
    appLog(tag: "StudentFollowing Response", msg: response?.bodyString ?? response);

    if (response != null && response.statusCode == 200) {
      if (response.body['success'] == true) {
        FollowingDataModel data =
        FollowingDataModel.fromJson(response.body);
        _studentFollowing.value = data.data?.following ?? [];
        _isStudentFollowingNotLoaded.value = false;
      } else {
        _isStudentFollowingNotLoaded.value = false;
        customSnackBar(response.body['message']);
      }
    } else {
      _isStudentFollowingNotLoaded.value = false;
      customSnackBar(response?.body['message'] ?? 'something_wrong'.tr);
    }
  }

}
