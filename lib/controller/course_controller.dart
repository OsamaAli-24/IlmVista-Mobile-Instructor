import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/data/model/common/course.dart';
import 'package:lms_user_app/data/model/instructor/instructor_course_list/instructor_course_list.dart';
import 'package:lms_user_app/repository/course_repository.dart';
import 'package:lms_user_app/utils/dev_util.dart';

class CourseController extends GetxController implements GetxService {

  final CourseRepository repository;
  CourseController({required this.repository});

  List categoriesList = ["1", "2","3","4"];
  List instructorList = ["1", "2","3","4"];
  List courseStatusList = ["1", "2","3","4"];
  List activelyList = ["1", "2","3","4"];

  String _selectCategory = "1";
  String _selectInstructor = "1";
  String _selectCourseStatus = "1";
  String _selectActively = "1";

  String get selectCategory => _selectCategory;
  String get selectInstructor => _selectInstructor;
  String get selectCourseStatus => _selectCourseStatus;
  String get selectActively => _selectActively;

  //pagination
  final _hasNextPage = RxBool(true);
  bool get hasNextPage => _hasNextPage.value;

  final _isFirstLoadRunning = RxBool(false);
  bool get isFirstLoadRunning => _isFirstLoadRunning.value;

  final _isLoadMoreRunning = RxBool(false);
  bool get isLoadMoreRunning => _isLoadMoreRunning.value;


  //course
  int _coursePageNumber = 0;
  final List<Course> _instructorCourseList = [];
  List<Course> get instructorCourseList => _instructorCourseList;

  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(loadMore);
    getInstructorCourseList(); // Load data initially
  }

  @override
  void onClose() {
    scrollController.removeListener(loadMore);
    super.onClose();
  }


  Future<void> getInstructorCourseList() async {
    _isFirstLoadRunning.value = true;
    _instructorCourseList.clear();
    _coursePageNumber = 0;

    try {
      final response = await repository.getAllCourses(page: _coursePageNumber);
      appLog(tag: "Instructor Course", msg: response?.bodyString ?? response);

      if (response != null && response.statusCode == 200) {
        if (response.body['success'] == true) {
          final list = InstructorCourseList.fromJson(response.body);
          _instructorCourseList.addAll(list.data!.courses!);
          if (list.data!.courses!.isEmpty) {
            _hasNextPage.value = false; // No more data
          } else {
            _coursePageNumber++;
          }
        }
      }
    } catch (err) {
      appLog(tag: "Course Loading error", msg: err);
    } finally {
      _isFirstLoadRunning.value = false;
    }
  }

  void loadMore() async {
    if (hasNextPage && !isFirstLoadRunning && !isLoadMoreRunning) {
      _isLoadMoreRunning.value = true;
      try {
        final response = await repository.getAllCourses(page: _coursePageNumber);

        appLog(tag: 'More course response', msg: response?.bodyString ?? response);
        appLog(tag: 'Course', msg: instructorCourseList);

        if (response != null && response.statusCode == 200) {
          if (response.body['success'] == true) {
            InstructorCourseList list =
            InstructorCourseList.fromJson(response.body);
            _instructorCourseList.addAll(list.data!.courses!);

            // if (list.data!.courses!.isNotEmpty) {
            //   _coursePageNumber++;
            // }

            if (list.data!.courses!.isEmpty) {
              _hasNextPage.value = false; // No more data
            } else {
              _coursePageNumber++;
            }
          }
        }
      } catch (err) {
        appLog(tag: "Course Loading error", msg: err);
      } finally {
        _isLoadMoreRunning.value = false;
      }
    }
  }

  updateCategory(String category){
    _selectCategory = category;
    update();
  }

  updateInstructor(String selectInstructor){
    _selectInstructor = selectInstructor;
    update();
  }

  updateCourseStatus(String selectCourseStatus){
    _selectCourseStatus = selectCourseStatus;
    update();
  }

  updateActively(String selectActively){
    _selectActively = selectActively;
    update();
  }

}