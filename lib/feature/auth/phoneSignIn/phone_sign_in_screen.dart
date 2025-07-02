import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/components/custom_button.dart';
import 'package:lms_user_app/components/custom_text_field.dart';
import 'package:lms_user_app/controller/auth_controller.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

class PhoneSignInScreen extends StatelessWidget {
  PhoneSignInScreen({Key? key}) : super(key: key);

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButtonExist: true,
        bgColor: Theme.of(context).primaryColor,
        title: 'enter_phone_number'.tr,
        //titleColor: Theme.of(context).textTheme.bodyLarge!.color,
        centerTitle: false,
      ),
      body: GetBuilder<AuthController>(builder: (controller) {
        return mainUI(context, controller);
      }),
    );
  }

  Column mainUI(BuildContext context, AuthController controller) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeExtraMoreLarge),
          child: Text(
            'enter_a_phone_to_get_otp'.tr,
            textAlign: TextAlign.center,
            style: poppinsRegular.copyWith(
              fontSize: Dimensions.fontSizeDefault,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
          child: Container(
            height: 45,
            width: MediaQuery.of(context).size.width,
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
            child: Row(
              children: [
                // SizedBox(
                //   width: 120,
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 10),
                //     child: CountryCodePicker(
                //       onChanged: (CountryCode? countryCode) {
                //         // Handle country code selection
                //         print("Selected country: ${countryCode!.name}");
                //         print("Country code: ${countryCode.dialCode}");
                //         print("Country flag: ${countryCode.flagUri}");
                //       },
                //       initialSelection: 'BD',
                //       favorite: ['+880', 'BD'],
                //       showCountryOnly: false,
                //       showOnlyCountryWhenClosed: false,
                //       alignLeft: false,
                //     ),
                //   ),
                // ),
                Expanded(
                  child: CustomTextField(
                    controller: controller.phoneController,
                    hintText: 'phone_number'.tr,
                    inputType: TextInputType.phone,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        //--------------------------------------------------phone sign in button
        SizedBox(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
            child: CustomButton(
                onPressed: () {
                  controller.getPhoneLoginOTP();
                  // Get.toNamed(RouteHelper.phoneOtpVerificationScreen,
                  //     arguments: {
                  //       'number': phoneController.value.text,
                  //       'isLogin': true
                  //     });
                },
                buttonText: 'continue'.tr),
          ),
        )
      ],
    );
  }
}
