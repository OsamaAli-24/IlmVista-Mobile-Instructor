import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/core/helper/help_me.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../../data/model/common/course.dart';

class ExploreCourseWidget extends StatelessWidget {
  final Course course;
  const ExploreCourseWidget({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteHelper.courseDetailsScreen, arguments: course.id);
      },
      child: Container(
        width: 155,
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06)),
            borderRadius: const BorderRadius.all(Radius.circular(6))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
              child: Image.network(
                course.thumbnail ?? "",
                height: 100,
                width: 155,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
              child: Column(
                children: [
                  Text(
                    course.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: poppinsMedium.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontSize: Dimensions.fontSizeDefault),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimensions.paddingSizeExtraSmall),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Images.playSmall),
                            const SizedBox(
                              width: Dimensions.paddingSizeMint,
                            ),
                            Text(
                              "${course.totalLessons ?? 0} Lessons",
                              style: poppinsRegular.copyWith(
                                  fontSize: Dimensions.fontSizeExtraSmall),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(Images.profileSmall),
                            const SizedBox(width: 2),
                            Text(
                              "${course.totalLessons ?? 0}",
                              style: poppinsRegular.copyWith(
                                  fontSize: Dimensions.fontSizeExtraSmall),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        calculateCoursePrice(course),
                        style: poppinsRegular.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: Dimensions.fontSizeSmall),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Images.starFill),
                          const SizedBox(
                            width: Dimensions.paddingSizeExtraSmall,
                          ),
                          Text(
                            course.totalRating ?? "0.0",
                            style: poppinsRegular.copyWith(
                                fontSize: Dimensions.fontSizeExtraSmall),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
