import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/confirmation_dialog.dart';
import 'package:lms_user_app/components/ripple_button.dart';
import 'package:lms_user_app/controller/auth_controller.dart';
import 'package:lms_user_app/controller/cart_controller.dart';
import 'package:lms_user_app/core/helper/responsive_helper.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/data/model/menu_model.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MenuButton extends StatelessWidget {
  final MenuModel menu;
  final bool isLogout;
  const MenuButton({super.key, required this.menu, required this.isLogout});

  @override
  Widget build(BuildContext context) {
    int count = ResponsiveHelper.isTab(context) ? 6 : 4;
    double size = ((context.width) / count) - Dimensions.paddingSizeDefault;

    return Stack(
      children: [
        Column(children: [
          Container(
            height: size - (size * 0.35),
            margin: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeSmall),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              menu.icon!,
              width: size,
              height: size,
              color: Get.isDarkMode? Colors.white54 : Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: Dimensions.paddingSizeSmall),
          Text(menu.title!,
              style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall),
              textAlign: TextAlign.center),
        ]),
        Positioned.fill(
          child: RippleButton(
            onTap: () async {
              if (isLogout) {
                Get.back();
                if (Get.find<AuthController>().isLoggedIn()) {
                  Get.dialog(
                      ConfirmationDialog(
                          icon: Images.logout,
                          description: 'are_you_sure_to_logout'.tr,
                          isLogOut: true,
                          onYesPressed: () {
                            Get.find<AuthController>().clearSharedData();
                            Get.find<CartController>().clearCartList();
                            Get.offAllNamed(
                                RouteHelper.getSignInRoute(RouteHelper.splash));
                          }),
                      useSafeArea: false);
                } else {
                  Get.toNamed(RouteHelper.getSignInRoute(RouteHelper.main));
                }
              } else if (menu.route!.startsWith('http')) {
                if (await canLaunchUrlString(menu.route!)) {
                  launchUrlString(menu.route!,
                      mode: LaunchMode.externalApplication);
                }
              } else if (menu.route!.contains('language')) {
              } else {
                Get.offNamed(menu.route!);
              }
            },
          ),
        )
      ],
    );
  }
}
