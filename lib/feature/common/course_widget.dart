import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../data/model/common/course.dart';

class CourseWidget extends StatelessWidget {
  final Course? course;
  const CourseWidget({Key? key, this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteHelper.getCourseDetailsScreenRoute(),
            arguments: course?.id);
      },
      child: Container(
        width: 155,
        //height: 197,

        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.06)),
            borderRadius: const BorderRadius.all(Radius.circular(6))),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          double containerHeight = constraints.maxHeight;
          double containerWidth = constraints.maxWidth;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                //-----------------------------------------------------course thumbnail
                child: Image.network(
                  course?.thumbnail ?? "",
                  height: containerHeight * 0.50,
                  width: containerWidth,
                  fit: BoxFit.fitHeight,
                  filterQuality: FilterQuality.high,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    Images.placeholderSquare,
                    height: containerHeight * 0.50,
                    width: containerWidth,
                    fit: BoxFit.fitHeight,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                child: Column(
                  children: [
                    //--------------------------------------------------------title
                    Text(
                      course?.title ?? "",
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
                              SvgPicture.asset(Images.playSmall,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(.6)),
                              const SizedBox(
                                width: Dimensions.paddingSizeMint,
                              ),
                              //---------------------------------------------total lessons
                              Text(
                                "${course?.totalLessons ?? 0} Lessons",
                                style: poppinsRegular.copyWith(
                                    fontSize: Dimensions.fontSizeExtraSmall,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(.6)),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(Images.profileSmall,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(.6)),
                              const SizedBox(width: 2),
                              //-------------------------------------total enrolls
                              Text(
                                "${course?.totalLessons ?? 0}",
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
                        //----------------------------------------------price
                        Text(
                          "${course?.price}",
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
                            //------------------------------------------total rating
                            Text(
                              course?.totalRating ?? "0.0",
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
          );
        }),
      ),
    );
  }
}
