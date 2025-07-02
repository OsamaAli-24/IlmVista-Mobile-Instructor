import 'package:get/get.dart';
import 'package:lms_user_app/controller/auth_controller.dart';
import 'package:lms_user_app/controller/barchart_controller.dart';
import 'package:lms_user_app/controller/book_store_controller.dart';
import 'package:lms_user_app/controller/cart_controller.dart';
import 'package:lms_user_app/controller/course_card_controller.dart';
import 'package:lms_user_app/controller/course_category_controller.dart';
import 'package:lms_user_app/controller/course_controller.dart';
import 'package:lms_user_app/controller/course_detail_controller.dart';
import 'package:lms_user_app/controller/enrollment_controller.dart';
import 'package:lms_user_app/controller/instructor_controller.dart';
import 'package:lms_user_app/controller/my_course_controller.dart';
import 'package:lms_user_app/controller/organization_controller.dart';
import 'package:lms_user_app/controller/profile_controller.dart';
import 'package:lms_user_app/controller/explore_controller.dart';
import 'package:lms_user_app/controller/home_controller.dart';
import 'package:lms_user_app/controller/html_view_controller.dart';
import 'package:lms_user_app/controller/language_controller.dart';
import 'package:lms_user_app/controller/notification_controller.dart';
import 'package:lms_user_app/controller/on_board_pager_controller.dart';
import 'package:lms_user_app/controller/payment_controller.dart';
import 'package:lms_user_app/controller/splash_controller.dart';
import 'package:lms_user_app/controller/user_controller.dart';
import 'package:lms_user_app/controller/wishlist_controller.dart';
import 'package:lms_user_app/feature/conversation/controller/conversation_controller.dart';
import 'package:lms_user_app/feature/conversation/repo/conversation_repo.dart';
import 'package:lms_user_app/repository/auth_repo.dart';
import 'package:lms_user_app/repository/course_category_repository.dart';
import 'package:lms_user_app/repository/course_detail_repo.dart';
import 'package:lms_user_app/repository/course_repository.dart';
import 'package:lms_user_app/repository/enrollent_repository.dart';
import 'package:lms_user_app/repository/explore_repository.dart';
import 'package:lms_user_app/repository/home_repository.dart';
import 'package:lms_user_app/repository/html_repository.dart';
import 'package:lms_user_app/repository/instructor_repository.dart';
import 'package:lms_user_app/repository/my_course_repository.dart';
import 'package:lms_user_app/repository/notification_repo.dart';
import 'package:lms_user_app/repository/organization_repository.dart';
import 'package:lms_user_app/repository/splash_repo.dart';
import 'package:lms_user_app/repository/user_repo.dart';
import 'package:lms_user_app/repository/wish_list_repository.dart';



class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    //common controller
    Get.lazyPut(() => SplashController(splashRepo: SplashRepo(apiClient: Get.find(), sharedPreferences: Get.find())));
    Get.lazyPut(() => AuthController(authRepo: AuthRepo(sharedPreferences: Get.find(), apiClient: Get.find())));
    Get.lazyPut(() => NotificationController(notificationRepo: NotificationRepo(apiClient: Get.find(), sharedPreferences: Get.find())));
    Get.lazyPut(() => LanguageController());
    Get.lazyPut(() => UserController(userRepo: UserRepo(apiClient: Get.find())));
    Get.lazyPut(() => HtmlViewController(htmlRepository: HtmlRepository(apiClient: Get.find())));
    Get.lazyPut(() => HomeController(homeRepository: HomeRepository(apiClient: Get.find())));
    Get.lazyPut(() => PaymentController());
    Get.lazyPut(() => OnBoardController());
    Get.lazyPut(() => BookStoreController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut<CourseController>(() => CourseController(repository: CourseRepository(apiClient: Get.find())));
    Get.lazyPut<CourseCardController>(() => CourseCardController());
    Get.lazyPut(() => ConversationController(conversationRepo: ConversationRepo(apiClient: Get.find())));
    Get.lazyPut(() => ExploreController(exploreRepository: ExploreRepository(apiClient: Get.find())));
    Get.lazyPut(() => InstructorController(repository: InstructorRepository(apiClient: Get.find())));
    Get.lazyPut(() => OrganizationController(repository: OrganizationRepository(apiClient: Get.find())));
    Get.lazyPut(() => MyCourseController(repository: MyCourseRepository(apiClient: Get.find())));
    Get.lazyPut(() => WishListController(repository: WishListRepository(apiClient: Get.find())));
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => BarchartController());
    Get.lazyPut(() => EnrollmentController(repository: EnrollmentRepository(apiClient: Get.find())));
  }
}
