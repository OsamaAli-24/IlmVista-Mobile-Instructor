import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/controller/auth_controller.dart';
import 'package:lms_user_app/core/helper/responsive_helper.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/data/model/menu_model.dart';
import 'package:lms_user_app/feature/menu/menu_button.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isLoggedIn = Get.find<AuthController>().isLoggedIn();
    double ratio = ResponsiveHelper.isTab(context) ? 1.1 : 1.2;
    final List<MenuModel> menuList = [
      MenuModel(
          icon: Images.menuProfile,
          title: 'profile'.tr,
          route: RouteHelper.instructorProfileScreen),
      // MenuModel(
      //     icon: Images.conversation,
      //     title: 'message'.tr,
      //     route: RouteHelper.getConversationList()),
      MenuModel(
          icon: Images.settingsMenu,
          title: 'settings'.tr,
          route: RouteHelper.settingScreen),
      MenuModel(
          icon: Images.privacyPolicy,
          title: 'privacy_policy'.tr,
          route: RouteHelper.getHtmlRoute('privacy-policy')),
      MenuModel(
          icon: Images.helpAndSupport,
          title: 'help_and_support'.tr,
          route: RouteHelper.getHtmlRoute('terms-and-condition')),
      MenuModel(
          icon: Images.logout,
          title: isLoggedIn ? 'logout'.tr : 'sign_in'.tr,
          route: ''),
    ];

    return Container(
      width: width,
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        color: Theme.of(context).cardColor,
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.keyboard_arrow_down_rounded,
                size: 30, color: Theme.of(context).colorScheme.primary)),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveHelper.isTab(context) ? 6 : 4,
            childAspectRatio: (1 / ratio),
            crossAxisSpacing: Dimensions.paddingSizeExtraSmall,
            mainAxisSpacing: Dimensions.paddingSizeExtraSmall,
          ),
          itemCount: menuList.length,
          itemBuilder: (context, index) {
            return MenuButton(
                menu: menuList[index], isLogout: index == menuList.length - 1);
          },
        ),
        SizedBox(
            height: ResponsiveHelper.isMobile(context)
                ? Dimensions.paddingSizeSmall
                : 0),
      ]),
    );
  }
}
