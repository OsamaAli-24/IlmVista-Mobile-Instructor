import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lms_user_app/components/custom_snackbar.dart';
import 'package:lms_user_app/core/helper/help_me.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/data/model/change_password_body.dart';
import 'package:lms_user_app/data/model/signup_body.dart';
import 'package:lms_user_app/data/model/social_login_body.dart';
import 'package:lms_user_app/repository/auth_repo.dart';
import 'package:lms_user_app/utils/dev_util.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});
  late FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool? _acceptTerms = false;
  final _instructorProfileImage = RxString('');

  bool get isLoading => _isLoading;
  bool? get acceptTerms => _acceptTerms;

  String get instructorProfileImage => authRepo.getInstructorProfileImage;

  ///TextEditingController for signUp screen
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var oldPasswordController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  dynamic countryDialCodeForSignup;

  ///textEditingController for signIn screen
  var signInEmailController = TextEditingController();
  var signInPasswordController = TextEditingController();
  dynamic countryDialCodeForSignIn;

  ///TextEditingController for forgot password
  var contactNumberController = TextEditingController();
  var countryDialCode;
  String _mobileNumber = '';
  String get mobileNumber => _mobileNumber;

  ///TextEditingController for new pass screen
  var newPasswordController = TextEditingController();
  var confirmNewPasswordController = TextEditingController();

  ///TextEditingController for change pass screen
  final currentPasswordControllerForChangePasswordScreen =
      TextEditingController();
  final newPasswordControllerForChangePasswordScreen = TextEditingController();
  final confirmPasswordControllerForChangePasswordScreen =
      TextEditingController();

  ///form validation key

  @override
  void onInit() {
    super.onInit();
    _isLoading = false;
    firstNameController.text = '';
    lastNameController.text = '';
    emailController.text = '';
    phoneController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
    contactNumberController.text = '';
    newPasswordController.text = '';
    confirmNewPasswordController.text = '';
    contactNumberController.text = '';
    signInEmailController.text = getUserNumber();
    signInPasswordController.text = getUserPassword();
  }

  fetchUserNamePassword() {
    signInEmailController.text = getUserNumber();
    signInPasswordController.text = getUserPassword();
  }

  _hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<void> registrationWithPhoneNumber() async {
    _hideKeyboard();
    _isLoading = true;
    update();
    SignUpBody signUpBody = SignUpBody(
        fName: firstNameController.value.text,
        lName: lastNameController.value.text,
        phone: phoneController.value.text,
        password: passwordController.value.text,
        confirmPassword: confirmPasswordController.value.text);
    if (!_isValidPassword()) {
      customSnackBar('password_missmatch'.tr);
      _isLoading = false;
      update();
      return;
    }

    Response? response = await authRepo.registerWithPhoneNumber(signUpBody);
    if (response != null && response.statusCode == 200) {
      if (response.body['success'] == true) {
        Get.toNamed(RouteHelper.phoneOtpVerificationScreen, arguments: {
          'number': phoneController.value.text,
          'isLogin': false
        });
        firstNameController.clear();
        lastNameController.clear();
        phoneController.clear();
      }
      customSnackBar(response.body['message'], isError: false);
    } else {
      customSnackBar(response?.body['data']['phone'][0].toString());
    }
    _isLoading = false;
    update();
  }

  Future<void> registration() async {
    _hideKeyboard();
    _isLoading = true;
    update();
    SignUpBody signUpBody = SignUpBody(
        fName: firstNameController.value.text,
        lName: lastNameController.value.text,
        email: emailController.value.text,
        password: passwordController.value.text,
        confirmPassword: confirmPasswordController.value.text);
    if (!_isValidPassword()) {
      customSnackBar('password_missmatch'.tr);
      _isLoading = false;
      update();
      return;
    }
    Response? response = await authRepo.registration(signUpBody);
    if (response != null && response.statusCode == 200) {
      if (response.body['success'] == true) {
        Get.toNamed(RouteHelper.emailVerificationScreen,
            arguments: emailController.value.text);
      }
      customSnackBar(response.body['message'], isError: false);
    } else {
      customSnackBar(response?.body['data']['email'][0].toString() ??
          response?.body['data']['password'][0].toString());
    }
    _isLoading = false;
    update();
  }

  bool _isValidPassword() {
    if (passwordController.value.text == confirmPasswordController.value.text) {
      return true;
    }
    return false;
  }

  Future<void> login() async {
    _isLoading = true;
    update();
    await authRepo
        .login(
            email: signInEmailController.text.trim(),
            password: signInPasswordController.value.text)
        .then((response) {
      appLog(tag: "Login Response", msg: response?.bodyString ?? response);

      if (response != null && response.statusCode == 200) {
        String token = response.body['data']['token'];
        String profileImage = response.body['data']['profile_image'];
        authRepo.saveUserToken(token);
        authRepo.saveProfileImage(profileImage);
        _instructorProfileImage.value = authRepo.getInstructorProfileImage;
        signInPasswordController.clear();
        signInEmailController.clear();
        Get.offAllNamed(
          RouteHelper.getMainRoute("0"),
        );
      } else {
        appLog(tag: "Login Response", msg: response);
        customSnackBar(response?.statusText ?? "Error", isError: true);
      }
      _isLoading = false;
    }).onError((error, stackTrace) {
      appLog(tag: "Login Error", msg: error);
      _isLoading = false;
    });

    // if (response != null && response.statusCode == 200) {
    //   String token = response.body['data']['token'];
    //   authRepo.saveUserToken(token);
    //   signInPasswordController.clear();
    //   signInEmailController.clear();
    //   Get.offAllNamed(RouteHelper.getMainRoute("0"));
    // } else {
    //   customSnackBar(response?.statusText ?? "Error", isError: true);
    // }

    update();
  }

  Future<void> _loginWithSocialMedia(SocialLogInBody socialLogInBody) async {
    _isLoading = true;
    update();
    Response? response = await authRepo.loginWithSocialMedia(socialLogInBody);
    printLog(response!.body);
    if (response.statusCode == 200) {
      String token = response.body['data']['token'];
      authRepo.saveUserToken(token);
      await authRepo.updateToken();
      Get.offAllNamed(RouteHelper.getMainRoute("0"));
    } else {
      customSnackBar(response.statusText!);
    }
    _isLoading = false;
    update();
  }

  //forgot password
  Future<void> forgetPasswordOTP() async {
    if (emailController.value.text.isEmpty) return;
    _hideKeyboard();
    _isLoading = true;
    update();
    Response? response =
        await authRepo.forgetPasswordOTP(emailController.value.text);

    appLog(tag: 'ForgotPassword', msg: response!.bodyString ?? response);

    if (response!.body['success'] == true) {
      customSnackBar(response.body['message'], isError: false);
      Get.toNamed(RouteHelper.forgotPasswordOTPVerificationScreen,
          arguments: emailController.value.text);
    } else {
      if (response.statusCode == 422) {
        customSnackBar(response.body['data']['email'][0].toString());
      } else {
        customSnackBar(response.body['message']);
      }
    }
    _isLoading = false;
    update();
  }

  //verfy OTP for forgot password
  Future<void> verifyOTPForForgotPassword(String email) async {
    _hideKeyboard();
    _isLoading = true;
    update();
    String otp = verificationCode;
    Response? response = await authRepo.verifyOTPForForgotPassword(email, otp);

    appLog(tag: 'Password OTP Response', msg: response!.bodyString ?? response);

    if (response != null && response.body['success'] == true) {
      Get.toNamed(RouteHelper.newPasswordScreen);
    } else {
      if (response!.statusCode == 422) {
        customSnackBar(response.body['data']['email'][0].toString());
      } else {
        customSnackBar(response.body['message']);
      }
    }
    _isLoading = false;
    update();
  }

  //-------------------------------change password
  Future<void> changeUserPassword() async {
    ChangePasswordBody passwordBody = ChangePasswordBody(
      oldPassword:
          currentPasswordControllerForChangePasswordScreen.text.toString(),
      newPassword: newPasswordControllerForChangePasswordScreen.text.toString(),
      confirmPassword:
          confirmPasswordControllerForChangePasswordScreen.text.toString(),
    );

    _hideKeyboard();
    _isLoading = true;
    update();
    Response? response = await authRepo.changeUserPassword(passwordBody);

    appLog(
        tag: 'Change Password Response', msg: response!.bodyString ?? response);

    // if (response != null && response.body['success'] == true) {
    //   // Get.toNamed(RouteHelper.newPasswordScreen);
    // } else {
    //   if (response!.statusCode == 422) {
    //     customSnackBar(response.body['data']['email'][0].toString());
    //   } else {
    //     customSnackBar(response.body['message']);
    //   }
    // }
    _isLoading = false;
    update();
  }

  //reset password
  Future<void> resetPassword() async {
    _hideKeyboard();
    String password = passwordController.value.text;
    String confirmPassword = confirmPasswordController.value.text;
    String otp = verificationCode;
    String email = emailController.value.text;
    printLog("$password, $confirmPassword, $otp, $email");
    Response? response = await authRepo.resetPassword(
        password: password,
        confirmPassword: confirmPassword,
        otp: otp,
        email: email);

    appLog(
        tag: 'Reset Password Response', msg: response!.bodyString ?? response);

    if (response != null && response.body['success'] == true) {
      passwordController.clear();
      confirmPasswordController.clear();
      verificationCode == "";
      emailController.clear();
      customSnackBar(response.body['message'], isError: false);
      Get.offAllNamed(RouteHelper.signIn);
    } else {
      if (response!.statusCode == 422) {
        customSnackBar(response.body['data']['password'][0].toString());
      } else {
        customSnackBar(response.body['message']);
      }
    }
  }

  Future<void> updateToken() async {
    await authRepo.updateToken();
  }

  Future<void> verifyPhoneOtp(String phoneNumber) async {
    if (phoneNumber.isEmpty) return;
    _isLoading = true;
    update();
    String otp = verificationCode;
    printLog("----verifyPhoneOtp ");

    Response? response = await authRepo.verifyPhoneOTP(phoneNumber, otp);
    printLog("----verifyPhoneOtp: ${response?.statusCode}");
    appLog(tag: "Verify Login OTP", msg: response?.bodyString ?? response);

    if (response != null && response.body['success']) {
      Get.offAllNamed(RouteHelper.signIn);
      customSnackBar(response.body['message'], isError: false);
    } else {
      customSnackBar(response?.body['message']);
    }
    _isLoading = false;
    update();
  }

  Future<void> resendPhoneOTP(String phoneNumber) async {
    Response? response = await authRepo.resendPhoneOTP(phoneNumber);
    if (response != null && response.body['success'] == true) {
      customSnackBar(response.body['message'], isError: false);
    }
  }

  //login
  Future<void> getPhoneLoginOTP() async {
    String phoneNumber = phoneController.value.text;
    if (phoneNumber.isEmpty) return;
    _isLoading = true;
    update();
    Response? response = await authRepo.getPhoneLoginOTP(phoneNumber);

    appLog(tag: 'Phone Login OTP', msg: response?.bodyString ?? response);

    if (response != null && response.statusCode == 200) {
      if (response.body['success'] == true) {
        Get.toNamed(RouteHelper.phoneOtpVerificationScreen,
            arguments: {'number': phoneController.value.text, 'isLogin': true});
        phoneController.clear();
      }
      customSnackBar(response.body['message'], isError: false);
    } else {
      customSnackBar(response?.body['data']['phone'][0].toString());
    }
    _isLoading = false;
    update();
  }

  Future<void> verifyLoginPhoneOtp(String phoneNumber) async {
    if (phoneNumber.isEmpty) return;
    _isLoading = true;
    update();
    String otp = verificationCode;

    Response? response = await authRepo.verifyLoginPhoneOTP(phoneNumber, otp);

    appLog(tag: "Verify Login OTP", msg: response?.bodyString ?? response);

    if (response != null && response.body['success']) {
      String token = response.body['data']['token'];
      authRepo.saveUserToken(token);
      // await authRepo.updateToken();
      Get.offAllNamed(RouteHelper.getMainRoute("0"));
    } else {
      customSnackBar(response?.body['data']['phone'][0].toString() ??
          response?.body['data']['otp'][0].toString());
    }
    _isLoading = false;
    update();
  }

  Future<void> verifyEmailOTP(String email) async {
    _isLoading = true;
    update();
    Response? response =
        await authRepo.verifyEmailOTP(email, _verificationCode);
    if (response != null && response.body['success']) {
      String token = response.body['data']['token'];
      authRepo.saveUserToken(token);
      // await authRepo.updateToken();
      firstNameController.clear();
      lastNameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      Get.offAllNamed(RouteHelper.getMainRoute("0"));
    } else {
      customSnackBar(response?.body['message']);
    }
    _isLoading = false;
    update();
  }

  Future<bool> resendEmailOTP(String email) async {
    Response? response = await authRepo.resendEmailOTP(email);
    if (response != null && response.body['success'] == true) {
      customSnackBar(response.body['message'], isError: false);
      return true;
    }
    customSnackBar(response?.body['message'], isError: false);
    return false;
  }

  String _verificationCode = '';
  String _otp = '';
  String get otp => _otp;
  String get verificationCode => _verificationCode;

  void updateVerificationCode(String query) {
    _verificationCode = query;
    if (_verificationCode.isNotEmpty) {
      _otp = _verificationCode;
    }
    update();
  }

  bool _isActiveRememberMe = false;
  bool get isActiveRememberMe => _isActiveRememberMe;

  void toggleTerms() {
    _acceptTerms = !_acceptTerms!;
    update();
  }

  void toggleRememberMe() {
    _isActiveRememberMe = !_isActiveRememberMe;
    update();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  String getUserNumber() {
    return authRepo.getUserNumber();
  }

  String getUserPassword() {
    return authRepo.getUserPassword();
  }

  Future<bool> clearUserNumberAndPassword() async {
    return authRepo.clearUserNumberAndPassword();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);
  // GoogleSignIn? _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;
  GoogleSignInAuthentication? auth;

  Future<void> socialLogin() async {
    _isLoading = true;
    update();
    try {
      googleAccount = await _googleSignIn.signIn();
      auth = await googleAccount?.authentication;
      if (auth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: auth?.accessToken,
          idToken: auth?.idToken,
        );
        final User? user = (await _auth.signInWithCredential(credential)).user;
        if (user != null) {
          SocialLogInBody body = SocialLogInBody(
              email: user.email,
              name: user.displayName,
              uid: user.uid,
              phone: user.phoneNumber);
          await _loginWithSocialMedia(body);
        }
      }
    } catch (error) {
      customSnackBar(error.toString());
      _isLoading = false;
      update();
    }
    _isLoading = false;
    update();
  }

  //facebook auth
  Future<void> facebookAuth() async {
    _isLoading = true;
    update();
    try {
      final response = await FacebookAuth.instance.login();
      if (response.accessToken != null) {
        final userData = await FacebookAuth.instance.getUserData();
        SocialLogInBody body = SocialLogInBody(
            email: userData['email'],
            name: userData['name'],
            uid: userData['id'],
            phone: "");

        await _loginWithSocialMedia(body);
      }
    } catch (e) {
      customSnackBar(e.toString());
      _isLoading = false;
      update();
    }

    _isLoading = false;
    update();
  }

  Future<void> googleLogout() async {
    googleAccount = (await _googleSignIn.signOut())!;
    auth = await googleAccount!.authentication;
  }

  Future<void> facebookLogout() async {
    await FacebookAuth.instance.logOut();
  }
}
