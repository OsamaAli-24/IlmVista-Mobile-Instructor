import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_button.dart';
import 'package:lms_user_app/controller/course_controller.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class CourseFilter extends StatelessWidget {
  const CourseFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseController>(
        builder: (controller){
          return Container(
            //height: 700,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
              )
            ),

            child: Padding(
                padding:  const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeDefault,
                    vertical: Dimensions.paddingSizeDefault
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 10,),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('course_filter'.tr,
                      style: poppinsSemiBold.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                          fontSize: Dimensions.fontSizeDefault
                      ),
                    ),
                    InkWell(
                      onTap: ()=> Get.back(),
                      borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                      child: Padding(
                        padding: const EdgeInsets.all( Dimensions.paddingSizeExtraSmall),
                        child: SvgPicture.asset(Images.cancel,
                          height: Dimensions.paddingSizeSmall,
                          width: Dimensions.paddingSizeSmall,
                          color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                        ),
                      ),
                    )
                  ],
                ),
                    const SizedBox(height:  Dimensions.paddingSizeSmall),
                    const Divider(),
                    const SizedBox(height:  Dimensions.paddingSizeSmall,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('categories'.tr,style: poppinsMedium.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontSize: Dimensions.fontSizeDefault),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
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
                          Radius.circular(Dimensions.paddingSizeExtraSmall),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5,top:  3,bottom: 3),
                        child: DropdownButton(
                          hint: Text('select'.tr),
                          value: controller.selectCategory,
                          isExpanded: true,
                          underline: Container(),
                          onChanged: (newValue) {
                            controller.updateCategory(newValue!);
                          },
                          items: controller.categoriesList.map((user) {
                            return DropdownMenuItem<String>(
                              value: user,
                              child: Text(
                                user,
                                style: poppinsRegular.copyWith(
                                    color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6)
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                    const SizedBox(height:  Dimensions.paddingSizeDefault,),
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('instructor'.tr,style: poppinsMedium.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontSize: Dimensions.fontSizeDefault),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
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
                          Radius.circular(Dimensions.paddingSizeExtraSmall),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5,top:  3,bottom: 3),
                        child: DropdownButton(
                          hint: Text('select'.tr),
                          value: controller.selectInstructor,
                          isExpanded: true,
                          underline: Container(),
                          onChanged: (newValue) {
                            controller.updateInstructor(newValue!);
                          },
                          items: controller.categoriesList.map((user) {
                            return DropdownMenuItem<String>(
                              value: user,
                              child: Text(
                                user,
                                style: poppinsRegular.copyWith(
                                    color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6)
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                    const SizedBox(height:  Dimensions.paddingSizeDefault,),
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('course_status'.tr,style: poppinsMedium.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontSize: Dimensions.fontSizeDefault),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
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
                          Radius.circular(Dimensions.paddingSizeExtraSmall),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5,top:  3,bottom: 3),
                        child: DropdownButton(
                          hint: Text('select'.tr),
                          value: controller.selectCourseStatus,
                          isExpanded: true,
                          underline: Container(),
                          onChanged: (newValue) {
                            controller.updateCourseStatus(newValue!);
                          },
                          items: controller.categoriesList.map((user) {
                            return DropdownMenuItem<String>(
                              value: user,
                              child: Text(
                                user,
                                style: poppinsRegular.copyWith(
                                    color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6)
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                    const SizedBox(height:  Dimensions.paddingSizeDefault,),
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('actively'.tr,style: poppinsMedium.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontSize: Dimensions.fontSizeDefault),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
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
                          Radius.circular(Dimensions.paddingSizeExtraSmall),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 5,top:  3,bottom: 3),
                        child: DropdownButton(
                          hint: Text('select'.tr),
                          value: controller.selectActively,
                          isExpanded: true,
                          underline: Container(),
                          onChanged: (newValue) {
                            controller.updateActively(newValue!);
                          },
                          items: controller.categoriesList.map((user) {
                            return DropdownMenuItem<String>(
                              value: user,
                              child: Text(
                                user,
                                style: poppinsRegular.copyWith(
                                    color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6)
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                    const SizedBox(height:  Dimensions.paddingSizeDefault,),
                    CustomButton(
                      onPressed: () {},
                      buttonText: 'filter'.tr,

                    ),
                    const SizedBox(height: 5,),
            ],
          ),
          ),
          );
        }
    );
  }

  Column genderField(BuildContext context, CourseController controller,String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: poppinsMedium.copyWith(
            color: Theme.of(context).textTheme.bodyLarge!.color,
            fontSize: Dimensions.fontSizeDefault),
        ),
        const SizedBox(height: Dimensions.paddingSizeSmall),
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
              Radius.circular(Dimensions.paddingSizeExtraSmall),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 5,top:  3,bottom: 3),
            child: DropdownButton(
              hint: Text('select'.tr),
              value: controller.selectCategory,
              isExpanded: true,
              underline: Container(),
              onChanged: (newValue) {
                controller.updateCategory(newValue!);
              },
              items: controller.categoriesList.map((user) {
                return DropdownMenuItem<String>(
                  value: user,
                  child: Text(
                    user,
                    style: poppinsRegular.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6)
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}