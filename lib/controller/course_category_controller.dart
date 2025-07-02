import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_snackbar.dart';
import 'package:lms_user_app/data/model/common/course.dart';
import 'package:lms_user_app/data/model/course_category/course_category_model.dart';
import 'package:lms_user_app/data/model/course_category/courses_by_category_model.dart';
import 'package:lms_user_app/repository/course_category_repository.dart';
import 'package:lms_user_app/utils/dev_util.dart';

class CourseCategoryController extends GetxController{
  final CourseCategoryRepository repository;

  CourseCategoryController({required this.repository});

  //selected index
  final _selectedIndex = RxInt(0);
  int get selectedIndex => _selectedIndex.value;

  //is loading
  final _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;
  //category
  final _categories = RxList<Categories>();
  List<Categories> get categories => _categories;

  //is course data loaded
  final _isCourseLoaded = RxBool(false);
  bool get isCourseLoaded => _isCourseLoaded.value;
  //course data
  final _courses = RxList<Course>();
  List<Course> get courses => _courses;
  
  //---------------------------------------------------------get courses data
  Future<void> getCoursesByCategory({String category = '0'}) async{
    _isCourseLoaded.value = true;

    final response = await repository.getCourseByCategory(category: category);

    appLog(tag: "Categories Response", msg: response?.bodyString ?? response);

    if (response != null && response.statusCode == 200) {
      if (response.body['success'] == true) {
        CoursesByCategoryModel coursesByCategoryModel = CoursesByCategoryModel.fromJson(response.body);
        _courses.value = coursesByCategoryModel.data?.courses ?? [];
      } else {
        customSnackBar(response.body['message']);
      }
    } else {
      customSnackBar(response?.body['message'] ?? 'something_wrong'.tr);
    }
    _isCourseLoaded.value = false;
  }


  //---------------------------------------------------------get categories data
  Future<void> getCourseCategories() async {
    _isLoading.value = true;

    final response = await repository.getCourseCategories();

    appLog(tag: "Categories Response", msg: response?.bodyString ?? response);

    if (response != null && response.statusCode == 200) {
      if (response.body['success'] == true) {
        CourseCategoryModel categoryModel = CourseCategoryModel.fromJson(response.body);
        _categories.value = categoryModel.data?.categories ?? [];
      } else {
        customSnackBar(response.body['message']);
      }
    } else {
      customSnackBar(response?.body['message'] ?? 'something_wrong'.tr);
    }
    _isLoading.value = false;
  }


  //--------------------------------------update selected item
  void updateSelectedIndex(int idx){
    _selectedIndex.value = idx;
  }
}