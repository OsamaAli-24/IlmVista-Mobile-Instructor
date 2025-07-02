import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lms_user_app/core/service/color_picker_service.dart';
import 'package:lms_user_app/utils/app_constants.dart';
import 'package:lms_user_app/utils/custom_scroll_bahavior.dart';
import 'package:lms_user_app/utils/messages.dart';
import 'controller/localization_controller.dart';
import 'controller/splash_controller.dart';
import 'controller/theme_controller.dart';
import 'core/helper/route_helper.dart';
import 'core/initial_binding/initial_binding.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'core/helper/language_di.dart' as di;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  await GetStorage.init();
  HttpOverrides.global = MyHttpOverrides();
  await FlutterDownloader.initialize();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Get.putAsync<ColorPickerService>(() => ColorPickerService().init());

  Map<String, Map<String, String>> languages = await di.init();
  String? bookingID;
  try {
    final RemoteMessage? remoteMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (remoteMessage != null) {
      bookingID = remoteMessage.data['booking_id'];
    }
  } catch (e) {
    //
  }
  runApp(MyApp(languages: languages, bookingID: bookingID));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>>? languages;
  final String? bookingID;
  const MyApp({super.key, @required this.languages, @required this.bookingID});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return GetBuilder<SplashController>(builder: (splashController) {
          return GetMaterialApp(
            title: AppConstants.APP_NAME,
            debugShowCheckedModeBanner: false,
            navigatorKey: Get.key,
            // scrollBehavior: const MaterialScrollBehavior().copyWith(
            //   dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
            // ),
            //scrollBehavior: CustomScrollBehavior(),
            initialBinding: InitialBinding(),
            theme: themeController.darkTheme ? dark : light,
            locale: localizeController.locale,
            translations: Messages(languages: languages),
            fallbackLocale: Locale(AppConstants.languages[0].languageCode!,
                AppConstants.languages[0].countryCode),
            //initialRoute: RouteHelper.getSplashRoute(),
            initialRoute: RouteHelper.splash,
            // initialRoute: RouteHelper.main,
            getPages: RouteHelper.routes,
            defaultTransition: Transition.topLevel,
            transitionDuration: const Duration(milliseconds: 500),
            builder: (context, child) {
              return ScrollConfiguration(
                behavior: CustomScrollBehavior(),
                child: SafeArea(child: child!),
              );
            },
          );
        });
      });
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
