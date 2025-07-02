import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/controller/course_card_controller.dart';
import 'package:lms_user_app/controller/course_category_controller.dart';
import 'package:lms_user_app/controller/course_controller.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/data/model/common/course.dart';
import 'package:lms_user_app/utils/dev_util.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../../utils/dimensions.dart';

enum MenuItem { viewCourse, manageStudent, statistics, inactive, active }

class CourseCard extends GetView<CourseCardController> {
  final Course? course;

  const CourseCard({Key? key, this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CourseCardController>().updateStatus(course?.status);

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
      child: InkWell(
        //---------------------------------------------------navigate to course detail screen
        onTap: () => Get.toNamed(RouteHelper.getCourseDetailsScreenRoute(),
            arguments: course?.id),
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
                    course?.thumbnail ?? Images.placeholderSquare,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.paddingSizeExtraLarge,
                            height: Dimensions.paddingSizeExtraLarge,
                            child: PopupMenuButton<MenuItem>(
                              padding: const EdgeInsets.all(0.0),
                              onSelected: (value) {
                                if (value == MenuItem.statistics) {
                                  Get.toNamed(RouteHelper.courseStatistics);
                                }
                              },
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    value: MenuItem.viewCourse,
                                    child: Text('view_course'.tr),
                                    onTap: () {
                                      Get.toNamed(RouteHelper.courseCategoryScreen);
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: MenuItem.manageStudent,
                                    child: Text('manage_student'.tr),
                                    onTap: () {
                                      Get.toNamed(
                                          RouteHelper.studentListScreen);
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: MenuItem.statistics,
                                    child: Text('statistics'.tr),
                                    onTap: () {
                                      Get.toNamed(RouteHelper.courseStatistics,
                                          arguments: {
                                            'total_enrolls':
                                                course?.totalEnrolls ?? 0,
                                            'total_lessons':
                                                course?.totalLessons ?? 0,
                                          });
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: MenuItem.inactive,
                                    child: Text(course!.status!.toLowerCase() ==
                                        'active'? 'inactive'.tr:'active'.tr),
                                    onTap: () {
                                      Get.find<CourseCardController>()
                                          .changeCourseStatus(course?.id, {
                                        'is_published':
                                            course!.status!.toLowerCase() ==
                                                    'active'
                                                ? false
                                                : true
                                      });

                                      appLog(
                                          tag: "Status",
                                          msg: Get.find<CourseCardController>()
                                              .status);
                                    },
                                  ),
                                ];
                              },
                            ),
                          )
                        ],
                      ),
                      //------------------------------------------------------------title
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: Text(
                          course?.title ??
                              'Mathematics with Animated Lessons with Animated Lessons..',
                          style: poppinsMedium.copyWith(
                              fontSize: Dimensions.fontSizeSemiSmall),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GetBuilder<CourseCardController>(builder: (controller) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //------------------------------------------------price
                            Text(
                              course?.price ?? "\$00.00",
                              style: poppinsMedium.copyWith(
                                  fontSize: Dimensions.fontSizeSmall,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Images.profile,
                                  height: Dimensions.paddingSizeSmall,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.6),
                                ),
                                const SizedBox(
                                  width: Dimensions.paddingSizeMint,
                                ),
                                //---------------------------------------------------enroll
                                Text(
                                  "${course?.totalEnrolls ?? 0} Enroll",
                                  style: poppinsRegular.copyWith(
                                      fontSize: Dimensions.fontSizeSmall,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withOpacity(0.6)),
                                ),
                              ],
                            ),
                            Container(
                                alignment: Alignment.center,
                                // child: !controller.isLoading
                                //     ? Text(
                                //         (course?.id == controller.selectedId
                                //                 ? controller.status
                                //                 : course?.status) ??
                                //             ''.tr,
                                //         style: poppinsSemiBold.copyWith(
                                //           color: Theme.of(context)
                                //               .colorScheme
                                //               .primary,
                                //           fontSize: Dimensions.fontSizeSmall,
                                //         ),
                                //       )
                                //     : const CircularProgressIndicator()
                                child: Text(
                                  (course?.status ?? 'Inactive').tr,
                                  style: poppinsSemiBold.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary,
                                    fontSize: Dimensions.fontSizeSmall,
                                  ),
                                )
                                ),

                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
