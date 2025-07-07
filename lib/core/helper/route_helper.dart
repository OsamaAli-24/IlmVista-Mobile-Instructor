import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/core/initial_binding/course_category_binding.dart';
import 'package:lms_user_app/core/initial_binding/course_deatils_binding.dart';
import 'package:lms_user_app/core/initial_binding/review_bindings.dart';
import 'package:lms_user_app/core/initial_binding/settings_binding.dart';
import 'package:lms_user_app/core/initial_binding/student_binding.dart';
import 'package:lms_user_app/feature/auth/change_password/change_password_screen.dart';
import 'package:lms_user_app/feature/auth/email_verification_screen.dart';
import 'package:lms_user_app/feature/auth/forgot_password/forgot_password_screen.dart';
import 'package:lms_user_app/feature/auth/forgot_password/otp_verification_screen.dart';
import 'package:lms_user_app/feature/auth/sign_up_screen.dart';
import 'package:lms_user_app/feature/bookDetails/book_details_screen.dart';
import 'package:lms_user_app/feature/bookStore/book_store_screen.dart';
import 'package:lms_user_app/controller/splash_controller.dart';
import 'package:lms_user_app/core/initial_binding/initial_binding.dart';
import 'package:lms_user_app/feature/auth/forgot_password/new_pass_screen.dart';
import 'package:lms_user_app/feature/auth/phoneSignIn/phone_sign_in_screen.dart';
import 'package:lms_user_app/feature/auth/sign_in_screen.dart';
import 'package:lms_user_app/feature/auth/phoneSignIn/phone_otp_verification_screen.dart';
import 'package:lms_user_app/feature/book_statistics/book_statiscs_screen.dart';
import 'package:lms_user_app/feature/cart/cart_screen.dart';
import 'package:lms_user_app/feature/classRoom/learning_screen.dart';
import 'package:lms_user_app/feature/contact_us_page.dart';
import 'package:lms_user_app/feature/conversation/view/conversation_list.dart';
import 'package:lms_user_app/feature/conversation/view/conversation_screen.dart';
import 'package:lms_user_app/feature/coupon/coupon_screen.dart';
import 'package:lms_user_app/feature/courseDetails/course_details_screen.dart';
import 'package:lms_user_app/feature/courseStatistics/course_statisticsa_screen.dart';
import 'package:lms_user_app/feature/courseStatistics/widget/course_total_view.dart';
import 'package:lms_user_app/feature/courses/course_category_screen.dart';
import 'package:lms_user_app/feature/enrollment/enrollment_screen.dart';
import 'package:lms_user_app/feature/html/html_viewer_screen.dart';
import 'package:lms_user_app/feature/instructorDetails/instructor_detail_screen.dart';
import 'package:lms_user_app/feature/invoice/invoice_screen.dart';
import 'package:lms_user_app/feature/landing/landing_screen.dart';
import 'package:lms_user_app/feature/meeting/meeting_screen.dart';
import 'package:lms_user_app/feature/not_logged_in_screen.dart';
import 'package:lms_user_app/feature/cheekOut/cheek_out_screen.dart';
import 'package:lms_user_app/feature/notification/notification_screen.dart';
import 'package:lms_user_app/feature/onboarding/view/onboarding_screen.dart';
import 'package:lms_user_app/feature/order/order_history_screen.dart';
import 'package:lms_user_app/feature/organization/edit_organization_screen.dart';
import 'package:lms_user_app/feature/organization/organization_screen.dart';
import 'package:lms_user_app/feature/profile/edit_profile_screen.dart';
import 'package:lms_user_app/feature/profile/instructor_profile/instructor_profile_screen.dart';
import 'package:lms_user_app/feature/profile/student_profile/student_profile_screen.dart';
import 'package:lms_user_app/feature/profile/widgets/certificate_screen.dart';
import 'package:lms_user_app/feature/quiz/quiz_start_page.dart';
import 'package:lms_user_app/feature/review/manage_review_screen.dart';
import 'package:lms_user_app/feature/root/view/not_found_screen.dart';
import 'package:lms_user_app/feature/root/view/update_screen.dart';
import 'package:lms_user_app/feature/settings/settings_screen.dart';
import 'package:lms_user_app/feature/splash_screen.dart';
import 'package:lms_user_app/feature/student_list/student_list_screen.dart';
import 'package:lms_user_app/manage_books/manage_books_screen.dart';
import 'package:lms_user_app/utils/app_constants.dart';
import 'package:lms_user_app/utils/html_type.dart';
import 'package:lms_user_app/utils/language_change.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String language = '/language';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String main = '/main';
  static const String home = '/home';
  static const String searchScreen = '/searchScreen';
  static const String service = '/service';
  static const String profileEdit = '/profile-edit';
  static const String notification = '/notification';
  static const String address = '/address';
  static const String html = '/html';
  static const String categories = '/categories';
  static const String support = '/help-and-support';
  static const String rateReview = '/rate-and-review';
  static const String cart = '/cart';
  static const String update = '/update';
  static const String settingScreen = '/settingScreen';
  static const String notLoggedScreen = '/notLoggedScreen';
  static const String courseDetailsScreen = '/courseDetailsScreen';
  static const String instructorDetails = '/instructorDetails';
  static const String cheekOutScreen = '/cheekOutScreen';
  static const String phoneSignIn = '/phoneSignIn';
  static const String phoneSignUpScreen = '/phone_sign_up_screen';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String bookStoreScreen = '/bookStoreScreen';
  static const String organizationScreen = '/organizationScreen';
  static const String editOrganizationScreen = '/editOrganizationScreen';
  static const String conversationScreen = '/conversationScreen';
  static const String couponScreen = '/couponScreen';
  static const String orderHistoryScreen = '/orderHistoryScreen';
  static const String phoneOtpVerificationScreen =
      '/phoneOtpVerificationScreen';
  static const String bookDetailsScreen = '/bookDetailsScreen';
  static const String invoiceScreen = '/invoiceScreen';
  static const String emailVerificationScreen = '/emailVerificationScreen';
  //forgot password
  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String forgotPasswordOTPVerificationScreen =
      '/forgot_password_otp_verification_screen';
  static const String newPasswordScreen = '/new_password_screen';
  static const String meetingScreen = '/meetingScreen';
  static const String certificateScreen = '/certificateScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String conversationList = '/conversationList';
  static const String quizStartPage = '/quizStartPage';
  static const String learningScreen = '/learningScreen';
  static const String languageChange = '/languageChange';
  static const String courseTotalView = '/courseTotalView';
  static const String courseStatistics = '/courseStatistics';
  static const String courseCategoryScreen = '/courseCategoryScreen';
  static const String manageReviewScreen = "/manageReviewScreen";
  static const String manageBooksScreen = '/manageBooksScreen';
  static const String bookStatisticsScreen = '/bookStaticsScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String signUpForOrganizationScreen =
      '/signUpForOrganizationScreen';
  static const String signUpForInstructorScreen = '/signUpForInstructorScreen';
  static const String studentProfileScreen = '/studentProfileScreen';
  static const String studentListScreen = '/studentListScreen';
  static const String instructorProfileScreen = '/instructorProfileScreen';
  static const String enrollmentScreen = '/enrollmentScreen';

  static String getInitialRoute() => initial;
  static String getSplashRoute() => splash;
  static String getLanguageRoute(String page) => '$language?page=$page';
  static String getSignInRoute(String page) => '$signIn?page=$page';
  static String getMainRoute(String page) => '$main?page=$page';
  //static String getSearchResultRoute({String? queryText}) => '$searchScreen?query=${queryText ?? ''}';
  static String getServiceRoute(String id) => '$service?id=$id';
  static String getEditProfileRoute() => profileEdit;
  static String getAddressRoute(String fromPage) =>
      '$address?fromProfileScreen=$fromPage';
  static String getHtmlRoute(String page) => '$html?page=$page';
  static String getCategoryRoute(String fromPage, String campaignID) =>
      '$categories?fromPage=$fromPage&campaignID=$campaignID';
  static String getSupportRoute() => support;
  static String getReviewRoute() => rateReview;
  static String getCourseDetailsScreenRoute() => courseDetailsScreen;
  static String getSearchScreen() => searchScreen;
  static String getInstructorDetails() => instructorDetails;
  static String getCartScreen() => cart;
  static String getCheekOutScreen() => cheekOutScreen;
  static String getPhoneSignIn() => phoneSignIn;
  static String getPhoneSignUpScreen() => phoneSignUpScreen;
  static String getOnBoardingScreen() => onBoardingScreen;
  static String getBookStoreScreen() => bookStoreScreen;
  static String getOrganizationScreen() => organizationScreen;
  static String getConversationScreen() => conversationScreen;
  static String getCouponScreen() => couponScreen;
  static String getOrderHistoryScreen() => orderHistoryScreen;
  static String getPhoneOtpVerificationScreen() => phoneOtpVerificationScreen;
  static String getBookDetailsScreen() => bookDetailsScreen;
  static String getInvoiceScreen() => invoiceScreen;
  static String getMeetingScreen() => meetingScreen;
  static String getCertificateScreen() => certificateScreen;
  static String getEditProfileScreen() => editProfileScreen;
  static String getConversationList() => conversationList;
  static String getQuizStartPage() => quizStartPage;
  static String getLearningScreen() => learningScreen;
  static String getLanguageChange() => languageChange;
  static String getCourseTotalView() => courseTotalView;
  static String getCourseStatistics() => courseStatistics;
  static String getCourseCategoryScreen() => courseCategoryScreen;
  static String getEnrollmentScreen() => enrollmentScreen;

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: signUp, page: () => const SignUpScreen()),
    GetPage(name: signIn, page: () => const SignInScreen()),
    GetPage(name: main, page: () => const MainScreen(pageIndex: 0)),
    GetPage(
        name: emailVerificationScreen,
        page: () => const EmailVerificationScreen()),
    //forgot password
    GetPage(
        name: forgotPasswordScreen, page: () => const ForgotPasswordScreen()),
    GetPage(
        name: forgotPasswordOTPVerificationScreen,
        page: () => const ForgotPasswordOTPVerificationScreen()),
    GetPage(name: newPasswordScreen, page: () => const NewPassScreen()),

    GetPage(
        binding: InitialBinding(),
        name: html,
        page: () => HtmlViewerScreen(
            htmlType: Get.parameters['page'] == 'terms-and-condition'
                ? HtmlType.termsAndConditions
                : Get.parameters['page'] == 'privacy-policy'
                    ? HtmlType.privacyPolicy
                    : Get.parameters['page'] == 'cancellation_policy'
                        ? HtmlType.cancellationPolicy
                        : Get.parameters['page'] == 'refund_policy'
                            ? HtmlType.refundPolicy
                            : HtmlType.aboutUs)),
    GetPage(name: support, page: () => getRoute(const ContactUsPage())),
    GetPage(
        name: update,
        page: () => UpdateScreen(isUpdate: Get.parameters['update'] == 'true')),
    GetPage(name: cart, page: () => const CartScreen()),
    GetPage(name: cheekOutScreen, page: () => const CheekOutScreen()),
    GetPage(
        name: rateReview,
        page: () => getRoute(Get.arguments ?? const NotFoundScreen())),
    GetPage(
        name: settingScreen,
        page: () => const SettingScreen(),
        binding: SettingsBinding()),
    GetPage(
        name: notLoggedScreen,
        page: () => NotLoggedInScreen(fromPage: Get.parameters['fromPage']!)),
    GetPage(
        name: courseDetailsScreen,
        page: () => const CourseDetailsScreen(),
        binding: CourseDetailBinding()),

    GetPage(
        name: instructorDetails, page: () => const InstructorDetailScreen()),
    GetPage(name: phoneSignIn, page: () => PhoneSignInScreen()),
    GetPage(name: onBoardingScreen, page: () => const OnBoardingScreen()),
    GetPage(name: bookStoreScreen, page: () => const BookStoreScreen()),
    GetPage(name: organizationScreen, page: () => const OrganizationScreen()),
    GetPage(
        name: editOrganizationScreen,
        page: () => const EditOrganizationScreen()),
    GetPage(name: manageReviewScreen, page: () => const ManageReviewScreen(), binding: ReviewBindings()),
    GetPage(name: manageBooksScreen, page: () => const ManageBooksScreen()),
    GetPage(
        name: bookStatisticsScreen, page: () => const BookStatisticsScreen()),
    GetPage(
        name: conversationScreen,
        page: () => const ConversationScreen(
            name: "", image: "", channelID: "", date: "", bookingID: "")),
    //GetPage(name: conversationScreen, page: () =>  ConversationScreen()),
    GetPage(name: couponScreen, page: () => const CouponScreen()),
    GetPage(name: orderHistoryScreen, page: () => const OrderHistoryScreen()),
    GetPage(
        name: phoneOtpVerificationScreen,
        page: () => const PhoneOtpVerificationScreen()),
    GetPage(name: bookDetailsScreen, page: () => const BookDetailsScreen()),
    GetPage(name: invoiceScreen, page: () => const InvoiceScreen()),
    GetPage(name: meetingScreen, page: () => const MeetingScreen()),
    GetPage(name: certificateScreen, page: () => const CertificateScreen()),
    GetPage(name: editProfileScreen, page: () => const EditProfileScreen()),
    GetPage(name: conversationList, page: () => const ConversationList()),
    GetPage(name: quizStartPage, page: () => const QuizStartPage()),
    GetPage(name: learningScreen, page: () => const LearningScreen()),
    GetPage(name: languageChange, page: () => const LanguageChange()),
    GetPage(name: courseTotalView, page: () => const CourseTotalView()),
    GetPage(name: courseStatistics, page: () => const CourseStatisticsScreen()),
    GetPage(
        name: courseCategoryScreen,
        page: () => const CourseCategoryScreen(),
        binding: CourseCategoryBinding()),
    GetPage(name: changePasswordScreen, page: () => ChangePasswordScreen()),
    GetPage(
        name: studentProfileScreen, page: () => const StudentProfileScreen(), binding: StudentBinding()),
    GetPage(
        name: studentListScreen,
        page: () => const StudentListScreen(),
        binding: StudentBinding()),
    GetPage(
        name: instructorProfileScreen,
        page: () => const InstructorProfileScreen()),
    GetPage(
        name: instructorDetails, page: () => const InstructorDetailScreen()),

    GetPage(name: notification, page: () => const NotificationScreen()),
    GetPage(name: enrollmentScreen, page: () => const EnrollmentScreen()),
  ];

  static getRoute(Widget navigateTo) {
    double minimumVersion = 1;
    if (Get.find<SplashController>().configModel.data != null) {
      if (GetPlatform.isAndroid) {
        minimumVersion = double.parse(Get.find<SplashController>()
            .configModel
            .data!
            .androidVersion
            .apkCode);
      } else if (GetPlatform.isIOS) {
        minimumVersion = double.parse(
            Get.find<SplashController>().configModel.data!.iosVersion.ipaCode);
      }
    }
    return AppConstants.APP_VERSION < minimumVersion
        ? const UpdateScreen(isUpdate: true)
        : navigateTo;
  }
}
