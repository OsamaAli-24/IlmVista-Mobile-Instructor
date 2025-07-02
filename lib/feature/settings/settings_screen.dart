import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/components/delete_account_dialog.dart';
import 'package:lms_user_app/controller/settings_controller.dart';
import 'package:lms_user_app/controller/theme_controller.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/language_change.dart';
import 'package:lms_user_app/utils/styles.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'setting'.tr,
        titleColor: Theme.of(context).textTheme.bodyLarge!.color!,
        bgColor: Theme.of(context).cardColor,
      ),
      body: GetBuilder<ThemeController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeDefault),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Gap(10),
                //-------------------------------------- theme
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          Images.theme,
                          height: 16,
                          width: 16,
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color!
                              .withOpacity(0.6),
                        ),
                        const SizedBox(
                          width: Dimensions.paddingSizeDefault,
                        ),
                        Text('dark_mode'.tr,
                            style: poppinsRegular.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color!,
                                fontSize: Dimensions.fontSizeSmall)),
                      ],
                    ),
                    FlutterSwitch(
                      width: 40,
                      height: 20,
                      valueFontSize: 20,
                      toggleSize: 20,
                      borderRadius: 30,
                      padding: 1.0,
                      showOnOff: false,
                      toggleColor: Colors.white,
                      activeColor: Colors.green,
                      inactiveColor: Colors.grey,
                      value: controller.darkTheme,
                      onToggle: (value) {
                        controller.toggleTheme();
                      },
                    )
                  ],
                ),
                const Gap(10),

                //-------------------------------------language
                InkWell(
                  onTap: () {
                    Get.bottomSheet(const LanguageChange(),
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimensions.paddingSizeSmall),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              Images.languageChange,
                              height: 16,
                              width: 16,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .color!
                                  .withOpacity(0.6),
                            ),
                            const SizedBox(
                              width: Dimensions.paddingSizeDefault,
                            ),
                            Text('language'.tr,
                                style: poppinsRegular.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!,
                                    fontSize: Dimensions.fontSizeSmall)),
                          ],
                        ),
                        Text("English",
                            style: poppinsRegular.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color!,
                                fontSize: Dimensions.fontSizeSmall))
                      ],
                    ),
                  ),
                ),

                const Gap(10),
                //--------------------------------------change password
                InkWell(
                    onTap: () {
                      Get.toNamed(RouteHelper.changePasswordScreen);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Dimensions.paddingSizeSmall),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                Images.lock,
                                height: 16,
                                width: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color!
                                    .withOpacity(0.6),
                              ),
                              const SizedBox(
                                width: Dimensions.paddingSizeDefault,
                              ),
                              Text('Change Password'.tr,
                                  style: poppinsRegular.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!,
                                      fontSize: Dimensions.fontSizeSmall)),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: Dimensions.fontSizeSmall,
                            color:
                                Theme.of(context).textTheme.bodyLarge!.color!,
                          )
                        ],
                      ),
                    )),

                const Gap(10),
                //--------------------------------------delete account
                InkWell(
                    onTap: () {
                      Get.dialog(DeleteAccountDialog(
                        onDelete: () async{
                          Navigator.pop(context);
                          await Get.find<SettingsController>().deleteUserAccount();
                        },

                        onCancel: (){
                          Navigator.pop(context);
                        },

                      ), barrierDismissible: true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Dimensions.paddingSizeSmall),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                Images.deleteAccount,
                                height: 16,
                                width: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color!
                                    .withOpacity(0.6),
                              ),
                              const SizedBox(
                                width: Dimensions.paddingSizeDefault,
                              ),
                              Text('Delete Account'.tr,
                                  style: poppinsRegular.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!,
                                      fontSize: Dimensions.fontSizeSmall)),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: Dimensions.fontSizeSmall,
                            color:
                            Theme.of(context).textTheme.bodyLarge!.color!,
                          )
                        ],
                      ),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
