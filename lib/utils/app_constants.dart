import 'package:lms_user_app/data/model/response/language_model.dart';
import 'package:lms_user_app/utils/images.dart';

class AppConstants {
  static const String APP_NAME = 'FacultyLMS';
  static const double APP_VERSION = 1.0;
  // static const String BASE_URL = 'http://192.168.1.227/lms/api/';
  // static const String BASE_URL = 'http://192.168.1.227/lms/api/';
  // static const String BASE_URL = 'https://faculty.spagreen.net/demo/api/';
  static const String BASE_URL = 'https://faculty.spagreen.net/demo/api/';

  //-------------------------------------------------------endpoints
  static const String instructorLogin = 'instructor-login';
  static const String instructorDashboard = 'instructor/dashboard';
  static const String earningStatistics = 'instructor/get-stats';
  static const String enrollments = 'instructor/enrollments';
  static const String categories = 'categories';
  static const String courseByCategory = 'instructor/category-courses/';
  static const String changeCourseStatus = 'instructor/change-status/';
  static const String changeUserPassword = 'user/change-password';
  static const String deleteUserAccount = 'user/delete-account';
  static const String updateInstructorProfile = 'instructor/update-profile';
  static const String courseDetails = 'instructor/courses-details/';
  static const String allReviews = 'instructor/reviews?';
  static const String studentProfile = 'instructor/student-profile/';
  static const String studentCourses = 'instructor/student-courses/';
  static const String studentFollowings = 'instructor/student-followings/';
  //----------------------------------------------------------------

  static const String configUrl = 'configs';
  static const String loginUrl = 'login';
  static const String socialLoginUrl = 'social-login';
  static const String registerUrl = 'register';
  static const String registerWithPhone = 'register-by-phone';
  static const String verifyPhoneOTP = 'verify-phone-otp';
  static const String resendPhoneOTP = 'resend-phone-otp';
  static const String getPhoneLoginOTP = 'get-login-otp';
  static const String verifyLoginPhoneOTP = 'verify-login-otp';
  static const String verifyEmailOTP = 'email-verify';
  static const String resendEmailOTP = 'resend-email-otp';
  static const String forgotPasswordOTP = 'get-verification-otp';
  static const String verifyOTPForForgotPassword = 'verify-otp';
  static const String resetPassword = 'reset-password';
  static const String explore = 'explore';
  static const String courseDetail = 'course';
  static const String homeScreen = 'home-screen';
  static const String latestCourse = 'latest-courses';
  static const String instructorProfile = 'instructor/profile';
  static const String instructorCourseList = 'instructor/courses';
  static const String instructorPendingCourseList =
      'instructor/pending-courses';
  static const String instructorStudentList = 'instructor/students';
  static const String followUnfollow = 'user/follow-unfollow';
  //organization
  static const String organizationProfile = 'organization/profile';
  static const String organizationCourseList = 'organization/courses';
  static const String organizationInstructorList = 'organization/instructors';
  //my course screen
  static const String myCourseList = 'user/my-courses';
  static const String myWishList = 'user/my-wishlists';
  static const String addOrRemoveWishList = 'user/add-remove-wishlist';
  //book store
  static const String bookStore = 'book-store';
  static const String latestBooks = 'latest-books';
  static const String bookDetail = 'book';
  static const String reviews = 'reviews';
  static const String writeReviews = 'user/write-review';

  //cart
  static const String addToCart = 'user/add-to-cart';
  static const String cartList = 'user/carts';
  static const String applyCoupon = 'user/apply-coupon';

  static const String theme = 'lms_theme';
  static const String token = 'lms_token';
  static const String instructorProfileImage = 'ins_profile_img';
  static const String countryCode = 'lms_country_code';
  static const String languageCode = 'lms_language_code';
  static const String userPassword = 'lms_user_password';
  static const String userNumber = 'lms_user_number';
  static const String userCountryCode = 'lms_user_country_code';
  static const String notification = 'lms_notification';
  static const String isSplashScreen = 'lms_splash_seen';
  static const String topic = 'customer';
  static const String localizationKey = 'X-localization';
  static const String configUri = '/api/v1/customer/config';
  static const String socialRegisterUrl = '/api/v1/auth/social-register';
  static const String tokenUrl = '/api/v1/customer/update/fcm-token';
  static const String notificationUrl = '/api/v1/customer/notification';
  static const String notificationCount = '/api/v1/customer/notification';
  static const String resetPasswordUrl = '/api/v1/customer/notification';
  static const String customerInfoUrl = '/api/v1/customer/notification';
  static const String updateProfileUrl = '/api/v1/customer/notification';
  static const String customerRemove = '/api/v1/customer/notification';
  static const String verifyTokenUrl = '/api/v1/customer/notification';
  static const String pages = '/api/v1/customer/config/pages';
  static const String verifyPhoneUrl = '/api/v1/customer/config/pages';
  static const String subscriptionUrl = '/api/v1/customer/config/pages';
  static const String createChannel = 'createChannel';
  static const String getChannelList = 'get-channel-list';
  static const String getConversation = 'get-conversation';
  static const String sendMessage = 'send-message';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.us,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: Images.arabicTwo,
        languageName: 'عربى',
        countryCode: 'SA',
        languageCode: 'ar'),
  ];
}
