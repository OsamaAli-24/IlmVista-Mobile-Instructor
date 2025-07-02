import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/components/custom_button.dart';
import 'package:lms_user_app/components/custom_text_field.dart';
import 'package:lms_user_app/controller/instructor_controller.dart';
import 'package:lms_user_app/controller/profile_controller.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../components/loading_indicator.dart';

class EditProfileScreen extends StatefulWidget {
  final String? restorationId;
  const EditProfileScreen({Key? key, this.restorationId}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with RestorationMixin {
  File? selectedImage;

  String base64Image = "";

   Future<void> chooseImage(type) async {
     XFile? image;
     if (type == "camera") {
       image = await ImagePicker()
           .pickImage(source: ImageSource.camera, imageQuality: 10);
     } else {
       image = await ImagePicker()
           .pickImage(source: ImageSource.gallery, imageQuality: 25);
     }
     if (image != null) {
       setState(() {
         selectedImage = File(image!.path);
         base64Image = base64Encode(selectedImage!.readAsBytesSync());
       });
     }
   }
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(1900),
          lastDate: DateTime(3000),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(
        //       'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        // ));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    Get.put(ProfileController());
    Get.find<InstructorController>().getInstructorProfile(1);
    Get.find<ProfileController>().profile ??= Get.find<InstructorController>().instructorProfile.data!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Edit Profile",
        isBackButtonExist: true,
        bgColor: Theme.of(context).cardColor,
        titleColor: Theme.of(context).textTheme.bodyLarge!.color,
      ),
      body: GetBuilder<ProfileController>(
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

  Widget mainUI(BuildContext context, ProfileController controller) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1), // Border radius
                    //------------------------------------------------- profile image
                    child: ClipOval(
                      child: Image.network(
                        controller.profile?.profilePic ?? Images.placeholderSquare,
                        fit: BoxFit.cover,
                        height: 75,
                        width: 75,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          Images.placeholderSquare,
                          height: 75,
                          width: 75,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 5,
                    //-----------------------------------------------------pick profile image
                    child: InkWell(
                      onTap: () {
                        chooseImage("Gallery");
                      },
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
            ),
            const SizedBox(height: 30),

            //---------------------------------------------------------first name input field
            commonField(
                controller: controller.firstNameController,
                context: context,
                title: 'first_name'.tr,
                hint: 'first_name'.tr),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //---------------------------------------------------------last name input field
            commonField(
                controller: controller.lastNameController,
                context: context,
                title: 'last_name'.tr,
                hint: 'last_name'.tr),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //---------------------------------------------------------email address input field
            commonField(
                controller: controller.emailController,
                context: context,
                title: 'email'.tr,
                hint: 'email_address'.tr),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //---------------------------------------------------------phone number input field
            commonField(
                controller: controller.phoneController,
                context: context,
                title: 'phone'.tr,
                hint: 'phone_number'.tr),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //---------------------------------------------------------designation input field
            commonField(
                controller: controller.designationController,
                context: context,
                title: 'designation'.tr,
                hint: 'designation'.tr),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //---------------------------------------------------------organization input field
            commonField(
                controller: controller.organizationController,
                context: context,
                title: 'organization'.tr,
                hint: 'organization'.tr),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //---------------------------------------------------------gender dropdown
            genderField(context, controller),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //-------------------------------------------------------------date of birth field
            dateOfBirthField(context, controller,
                onTap: () => _restorableDatePickerRouteFuture.present(),
                date: _selectedDate.value),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //---------------------------------------------------------address input field
            addressField(context, controller),
            const SizedBox(height: Dimensions.paddingSizeLarge),

            //---------------------------------------------------------facebook input field
            commonField(
                controller: controller.facebookController,
                context: context,
                title: 'facebook'.tr,
                hint: 'facebook_url'.tr),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //---------------------------------------------------------twitter input field
            commonField(
                controller: controller.twitterController,
                context: context,
                title: 'twitter'.tr,
                hint: 'twitter_url'.tr),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //---------------------------------------------------------instagram input field
            commonField(
                controller: controller.instagramController,
                context: context,
                title: 'instagram'.tr,
                hint: 'instagram_url'.tr),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //---------------------------------------------------------linkedin input field
            commonField(
                controller: controller.linkedinController,
                context: context,
                title: 'linkedin'.tr,
                hint: 'linkedin_url'.tr),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //---------------------------------------------------------update profile button
            CustomButton(
                onPressed: () {
                  controller.changeProfileData();
                },
                buttonText: 'update_profile'.tr),
            const SizedBox(height: Dimensions.paddingSizeExtraLarge),
          ],
        ),
      ),
    );
  }
}

Column genderField(BuildContext context, ProfileController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'gender'.tr,
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
            Radius.circular(Dimensions.paddingSizeExtraSmall),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 5, top: 3, bottom: 3),
          child: Obx(() => DropdownButton<String>(
                hint: Text('select_gender'.tr),
                value: controller.selectedGender,
                isExpanded: true,
                underline: Container(),
                onChanged: (String? newValue) {
                  controller.updateGender(newValue);
                },
                items: controller.genderList.map((user) {
                  return DropdownMenuItem<String>(
                    value: user,
                    child: Text(
                      user,
                      style: poppinsRegular.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color!
                              .withOpacity(0.6)),
                    ),
                  );
                }).toList(),
              )),
        ),
      ),
    ],
  );
}

Column designationField(BuildContext context, ProfileController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'designation'.tr,
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
          hintText: 'designation'.tr,
          // controller: controller.emailController,
        ),
      ),
    ],
  );
}

Widget commonField(
    {required BuildContext context,
    required String title,
    required String hint,
    TextEditingController? controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
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
          controller: controller,
          hintText: hint,
          // controller: controller.emailController,
        ),
      ),
    ],
  );
}

Column dateOfBirthField(BuildContext context, ProfileController controller,
    {void Function()? onTap, DateTime? date}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Date of Birth'.tr,
        style: poppinsMedium.copyWith(
            color: Theme.of(context).textTheme.bodyLarge!.color,
            fontSize: Dimensions.fontSizeDefault),
      ),
      const SizedBox(height: Dimensions.paddingSizeDefault),
      GestureDetector(
        onTap: onTap,
        child: Container(
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
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${date?.day}-${date?.month}-${date?.year}",
                  style: poppinsRegular.copyWith(
                      color: Theme.of(context).textTheme.bodyLarge!.color!),
                ),
                SvgPicture.asset(Images.calendar),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Column addressField(BuildContext context, ProfileController controller) {
  return Column(
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
        //height: 44,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06),
          ),
          borderRadius: const BorderRadius.all(
              Radius.circular(Dimensions.paddingSizeExtraSmall)),
        ),
        child: CustomTextField(
          controller: controller.addressController,
          hintText: 'address'.tr,
          maxLines: 3,
        ),
      ),
    ],
  );
}
