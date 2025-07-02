import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/components/custom_button.dart';
import 'package:lms_user_app/components/custom_text_field.dart';
import 'package:lms_user_app/controller/auth_controller.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../components/loading_indicator.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButtonExist: true,
        bgColor: Theme.of(context).cardColor,
        titleColor: Theme.of(context).textTheme.bodyLarge!.color,
      ),
      body: GetBuilder<AuthController>(
        builder: (controller) {
          return Container(
            color: Theme.of(context).cardColor,
            child: Stack(
              children: [
                mainUI(context, controller),
                controller.isLoading
                    ? const LoadingIndicator()
                    : const SizedBox(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget mainUI(BuildContext context, AuthController controller) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Images.splash,
              scale: 4,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 46),
            Text('sign_in'.tr,
                style: poppinsBold.copyWith(
                    fontSize: Dimensions.fontSizeOverLarge,
                    color: Theme.of(context).textTheme.bodyLarge!.color!)),
            const SizedBox(height: 60),
            emailField(context, controller),
            const SizedBox(height: Dimensions.paddingSizeSmall),
            passwordField(context, controller),
            const SizedBox(height: Dimensions.paddingSizeExtraLarge),
            //-----------------------------------------------------------login button
            CustomButton(
                // onPressed: () => controller.login(),
                onPressed: () => Get.toNamed(RouteHelper.getMainRoute('0')),
                buttonText: 'sign_in'.tr),
            const SizedBox(height: 30),
            const SizedBox(height: Dimensions.paddingSizeExtraLarge),
            //continueButton(context),
            // const SizedBox(height: Dimensions.paddingSizeExtraLarge),
          ],
        ),
      ),
    );
  }

  InkWell continueButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteHelper.main);
      },
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
        child: Text('or_continue_with'.tr,
            style: poppinsRegular.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.5),
                fontSize: Dimensions.fontSizeSmall)),
      ),
    );
  }

  Widget emailField(BuildContext context, AuthController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!
                  .withOpacity(0.06),
            ),
            borderRadius: const BorderRadius.all(
                Radius.circular(Dimensions.paddingSizeExtraSmall)),
          ),
          child: CustomTextField(
            hintText: 'email_address'.tr,
            controller: controller.signInEmailController,
            inputType: TextInputType.emailAddress,
            prefixIcon: Padding(
              padding:
                  const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.paddingSizeDefault,
                  top: Dimensions.paddingSizeDefault,
                  bottom: Dimensions.paddingSizeDefault,
                ),
                child: SvgPicture.asset(
                  Images.mail,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall),
        //----------------------------------------------------------------login with phone
        // InkWell(
        //   onTap: () {
        //     Get.toNamed(RouteHelper.phoneSignIn);
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
        //     child: Text(
        //       'sign_in_with_phone'.tr,
        //       style: poppinsRegular.copyWith(
        //           color: Theme.of(context).colorScheme.primary,
        //           fontSize: Dimensions.fontSizeSmall),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Column passwordField(BuildContext context, AuthController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.06)),
            borderRadius: const BorderRadius.all(
                Radius.circular(Dimensions.paddingSizeExtraSmall)),
          ),
          child: CustomTextField(
            hintText: 'password'.tr,
            controller: controller.signInPasswordController,
            inputType: TextInputType.visiblePassword,
            prefixIcon: Padding(
              padding:
                  const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Dimensions.paddingSizeDefault,
                  top: Dimensions.paddingSizeDefault,
                  bottom: Dimensions.paddingSizeDefault,
                ),
                child: SvgPicture.asset(
                  Images.lock,
                ),
              ),
            ),
            isPassword: true,
          ),
        ),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall),
        InkWell(
          onTap: () {
            Get.toNamed(RouteHelper.forgotPasswordScreen);
          },
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
            child: Text(
              'forget_password'.tr,
              style: poppinsRegular.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Dimensions.fontSizeSmall),
            ),
          ),
        ),
      ],
    );
  }
}
