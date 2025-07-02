import 'package:get/get.dart';
import 'package:lms_user_app/controller/student_controller.dart';

class StudentBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<StudentController>(() => StudentController());
  }

}