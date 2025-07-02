import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/loading_indicator.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';

import '../../../components/custom_app_bar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_field.dart';
import '../../../controller/auth_controller.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButtonExist: true,
        title: 'forgot_password'.tr,
        centerTitle: false,
        bgColor: Theme.of(context).cardColor,
        titleColor: Theme.of(context).textTheme.bodyLarge!.color,
      ),
      body: GetBuilder<AuthController>(builder: (controller) {
        return Stack(
          children: [
            mainUI(context, controller),
            controller.isLoading ? const LoadingIndicator() : const SizedBox(),
          ],
        );
      }),
    );
  }

  Column mainUI(BuildContext context, AuthController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
          child: Text('enter_your_login_main'.tr),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeLarge),
          child: Container(
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
              controller: controller.emailController,
              hintText: 'email_address'.tr,
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
                    color: const Color(0xff999999),
                  ),
                ),
              ),
            ),
          ),
        ),
        //const SizedBox(height: Dimensions.paddingSizeSmall),
        const Spacer(),
        SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
            //--------------------------------------------------------- forgot password button
            child: CustomButton(
                onPressed: () => controller.forgetPasswordOTP(),
                // onPressed: () => Get.toNamed(
                //     RouteHelper.forgotPasswordOTPVerificationScreen, arguments: 'mahmud@spagreen.net'),
                buttonText: 'submit'.tr
            ),
          ),
        )
      ],
    );
  }
}
