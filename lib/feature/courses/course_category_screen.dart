import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/components/custom_button.dart';
import 'package:lms_user_app/controller/course_category_controller.dart';
import 'package:lms_user_app/data/model/common/course.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';

import '../../utils/styles.dart';

class CourseCategoryScreen extends StatefulWidget {
  const CourseCategoryScreen({Key? key}) : super(key: key);

  @override
  State<CourseCategoryScreen> createState() => _CourseCategoryScreenState();
}

class _CourseCategoryScreenState extends State<CourseCategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CourseCategoryController>().getCourseCategories();
    Get.find<CourseCategoryController>().getCoursesByCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButtonExist: true,
        title: 'course_category'.tr,
        titleColor: Theme.of(context).primaryColorLight,
        centerTitle: false,
      ),
      body: GetBuilder<CourseCategoryController>(
        builder: (controller) {
          return Row(
            children: [
              _categorySection(controller),
              _categoryBasedCourse(controller),
            ],
          );
        },
      ),
    );
  }

  //--------------------------------------------------------category list
  _categorySection(CourseCategoryController controller) {
    return Obx(() => SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          child: controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: index == 0 ? Dimensions.paddingSizeDefault : 0,
                        bottom: Dimensions.paddingSizeDefault,
                        left: Dimensions.paddingSizeDefault,
                        right: Dimensions.paddingSizeDefault,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          controller.updateSelectedIndex(index);
                          controller.getCoursesByCategory(
                              category: index.toString());
                        },
                        //-----------------------------------------------------------category item container
                        child: Obx(() => Container(
                              padding: const EdgeInsets.all(10),
                              constraints: const BoxConstraints(minWidth: 65),
                              decoration: BoxDecoration(
                                color: controller.selectedIndex == index
                                    ? const Color(0xFF2357A4)
                                    : null,
                                border: Border.all(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.06),
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(Dimensions.radiusSmall)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(
                                      controller.categories[index].icon ?? '',
                                      scale: 1.0,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                                Images.placeholderSquare,
                                                fit: BoxFit.cover,
                                              )),
                                  const SizedBox(
                                    height: Dimensions.paddingSizeSmall,
                                  ),
                                  Text(
                                    controller.categories[index].title ??
                                        "SSC Level",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 9,
                                        color: controller.selectedIndex == index
                                            ? Colors.white
                                            : null),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    );
                  }),
        ));
  }

  _categoryBasedCourse(CourseCategoryController controller) {
    return Expanded(
        child: Obx(() => controller.isCourseLoaded
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.courses.isEmpty
                ? const Center(
                    child: Text('No course found'),
                  )
                : ListView.builder(
                    itemCount: controller.courses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: index == 0 ? Dimensions.paddingSizeDefault : 0,
                          bottom: Dimensions.paddingSizeDefault,
                          left: 0,
                          right: Dimensions.paddingSizeDefault,
                        ),
                        child: item(context, controller.courses[index]),
                      );
                    })));
  }

  Container item(BuildContext context, Course course) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color:
              Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06),
        ),
        borderRadius:
            const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //------------------------------------------------thumbnail
              ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(Dimensions.radiusSmall)),
                child: Image.network(
                  course.thumbnail ?? '',
                  width: 70,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    Images.placeholderSquare,
                    width: 70,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: Dimensions.paddingSizeSmall,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.06),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeExtraSmall,
                            vertical: Dimensions.paddingSizeMint),
                        child: Text(
                          'higher_level'.tr,
                          style: poppinsRegular.copyWith(
                              fontSize: Dimensions.fontSizeExtraSmall,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      //----------------------------------------------------course title
                      child: Text(
                        course.title ?? '',
                        style: poppinsMedium.copyWith(
                            fontSize: Dimensions.fontSizeSemiSmall),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //--------------------------------------------course price
                        Text(
                          course.price ?? "\$00.00",
                          style: poppinsMedium.copyWith(
                              fontSize: Dimensions.fontSizeSmall,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .color!),
                        ),
                        //---------------------------------------------more button
                        GestureDetector(
                          onTap: () {
                            //------------------------course inactive dialog
                            Get.dialog(AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              content: Container(
                                height: 170,
                                width: size.width,
                                alignment: Alignment.topCenter,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  children: [
                                    //-------------------------------------------title
                                    const Gap(8),
                                    Text(
                                      'Course Status',
                                      style: poppinsSemiBold.copyWith(
                                          fontSize: 16,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),

                                    //--------------------------------------------sub title
                                    const Gap(16),
                                    Text(
                                        'Are you sure you want ot inactive this course?',
                                        textAlign: TextAlign.center,
                                        style: poppinsRegular.copyWith(
                                          fontSize: 12,
                                          color: const Color(0xFF333333),
                                        )),

                                    const Gap(36),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        //------------------------------------cancel button
                                        CustomButton(
                                          buttonText: 'Cancel',
                                          width: 100,
                                          backgroundColor:
                                              const Color(0xFFEEEEEE),
                                          textColor: Colors.black,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        //-------------------------------------inactive button
                                        CustomButton(
                                          buttonText: 'Inactive',
                                          width: 100,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.06),
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(Dimensions.radiusSmall))),
                            child: Text(
                              'more'.tr,
                              style: poppinsSemiBold.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: Dimensions.fontSizeSmall),
                            ),
                          ),
                        ),

                        // PopupMenuButton<MenuItem>(
                        //   padding: const EdgeInsets.all(0.0),
                        //   splashRadius: 0,
                        //   child: Container(
                        //     padding: const EdgeInsets.all(4),
                        //     decoration: BoxDecoration(
                        //         border: Border.all(
                        //           color: Theme.of(context)
                        //               .textTheme
                        //               .bodyLarge!
                        //               .color!
                        //               .withOpacity(0.06),
                        //         ),
                        //         borderRadius: const BorderRadius.all(
                        //             Radius.circular(Dimensions.radiusSmall))),
                        //     child: Text(
                        //       'more'.tr,
                        //       style: poppinsSemiBold.copyWith(
                        //           color: Theme.of(context).colorScheme.primary,
                        //           fontSize: Dimensions.fontSizeSmall),
                        //     ),
                        //   ),
                        //   onSelected: (value) {
                        //     if (value == MenuItem.statistics) {
                        //       Get.toNamed(RouteHelper.courseStatistics);
                        //     }
                        //   },
                        //   itemBuilder: (context) {
                        //     return [
                        //       PopupMenuItem(
                        //         value: MenuItem.viewCourse,
                        //         child: Text('view_course'.tr),
                        //         onTap: () {},
                        //       ),
                        //       PopupMenuItem(
                        //         value: MenuItem.manageStudent,
                        //         child: Text('manage_student'.tr),
                        //         onTap: () {},
                        //       ),
                        //       PopupMenuItem(
                        //         value: MenuItem.statistics,
                        //         child: Text('statistics'.tr),
                        //       ),
                        //       PopupMenuItem(
                        //         value: MenuItem.inactive,
                        //         child: Text('inactive'.tr),
                        //         onTap: () {},
                        //       ),
                        //     ];
                        //   },
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
