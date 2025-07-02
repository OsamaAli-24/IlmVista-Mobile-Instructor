import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/app_color_picker.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/components/custom_button.dart';
import 'package:lms_user_app/core/service/color_picker_service.dart';

import '../../components/custom_text_field.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';

class EditOrganizationScreen extends StatelessWidget {
  const EditOrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "edit_organization".tr,
        bgColor: Theme.of(context).cardColor,
        centerTitle: false,
        titleColor: Theme.of(context).textTheme.bodyLarge!.color,
      ),
      body: mainUI(context),
    );
  }

  Widget mainUI(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageWidget(context),
            const SizedBox(height: Dimensions.paddingSizeDefault * 2),
            Container(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
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
                child: Column(
                  children: [
                    nameField(context),
                    brandColorField(context),
                    phoneField(context),
                    emailField(context),
                    addressField(context)
                  ],
                )),
            const SizedBox(height: 50),
            CustomButton(buttonText: 'update_profile'.tr)
          ],
        ),
      ),
    );
  }
}

Widget imageWidget(BuildContext context) => Center(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(1), // Border radius
            child: ClipOval(
                child: Image.network(
              '',
              fit: BoxFit.cover,
              height: 75,
              width: 75,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                Images.placeholderSquare,
                fit: BoxFit.cover,
                height: 75,
                width: 75,
              ),
            )),
          ),
          Positioned(
            bottom: 4,
            right: 5,
            child: InkWell(
              onTap: () => null,
              child: Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                  //color: Colors.white,
                ),
                child: Icon(
                  Icons.edit,
                  color: Theme.of(context).cardColor,
                  size: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );

Widget nameField(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'organization_name'.tr,
        style: poppinsMedium.copyWith(
            color: Theme.of(context).textTheme.bodyLarge!.color,
            fontSize: Dimensions.fontSizeDefault),
      ),
      const SizedBox(height: Dimensions.paddingSizeDefault),
      Container(
        height: 44,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06),
          ),
          borderRadius: const BorderRadius.all(
              Radius.circular(Dimensions.paddingSizeExtraSmall)),
        ),
        child: CustomTextField(
          hintText: 'organization_name'.tr,
          //controller: controller.firstNameController,
        ),
      ),
    ],
  );
}

Widget brandColorField(BuildContext context) {

  return Padding(
    padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'brand_color'.tr,
          style: poppinsMedium.copyWith(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: Dimensions.fontSizeDefault),
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),
        Container(
          height: 44,
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
          child: Obx(() => CustomTextField(
              hintText: '#${ColorPickerService.to.hexCode}',
              //controller: controller.firstNameController,
              isShowSuffixIcon: true,
              prefix: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  height: 20,
                  width: 20,

                  decoration: BoxDecoration(
                    color: Color(ColorPickerService.to.selectedColor),
                    shape: BoxShape.circle,

                    border: Border.all(
                      width: 2,
                      color: Colors.black,
                      strokeAlign: BorderSide.strokeAlignOutside
                    )
                  ),
                ),
              ),
              suffixIcon: InkWell(
                onTap: (){
                  Get.dialog(
                      const AppColorPicker()
                  );
                },
                child: const Icon(Icons.colorize, size: 28, color: Colors.black54,),
              )
          ))
        ),
      ],
    ),
  );
}

Widget phoneField(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'phone'.tr,
          style: poppinsMedium.copyWith(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: Dimensions.fontSizeDefault),
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),
        Container(
          height: 44,
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
            hintText: 'phone'.tr,
            //controller: controller.firstNameController,
          ),
        ),
      ],
    ),
  );
}

Widget emailField(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'email'.tr,
          style: poppinsMedium.copyWith(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: Dimensions.fontSizeDefault),
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),
        Container(
          height: 44,
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
            hintText: 'email'.tr,
            //controller: controller.firstNameController,
          ),
        ),
      ],
    ),
  );
}

Widget addressField(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'address'.tr,
          style: poppinsMedium.copyWith(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: Dimensions.fontSizeDefault),
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),
        Container(
          height: 44,
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
            hintText: 'address'.tr,
            //controller: controller.firstNameController,
          ),
        ),
      ],
    ),
  );
}
