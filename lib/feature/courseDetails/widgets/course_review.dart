import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_button.dart';
import 'package:lms_user_app/components/rating_view.dart';
import 'package:lms_user_app/components/review_progress.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/data/model/review_model.dart';
import 'package:lms_user_app/data/model/user_review/review.dart';
import 'package:lms_user_app/utils/date_time_util.dart';
import 'package:lms_user_app/utils/dev_util.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CourseReview extends StatelessWidget {
  final int totalReview;
  final String avgRatings;
  final bool isReviewed;
  final bool isCanReview;
  final bool showStatus;
  final List<Review> reviewList;

  const CourseReview(
      {Key? key,
      this.showStatus = false,
      required this.totalReview,
      required this.avgRatings,
      required this.isReviewed,
      required this.isCanReview,
      required this.reviewList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'course_review'.tr,
                style: poppinsSemiBold.copyWith(
                    fontSize: Dimensions.fontSizeDefault,
                    color: Theme.of(context).textTheme.bodyLarge!.color!),
              ),
              isCanReview == false
                  ? const SizedBox()
                  : Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.06),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radiusSmall),
                          bottomLeft: Radius.circular(Dimensions.radiusSmall),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeSmall,
                            vertical: Dimensions.paddingSizeRadius),
                        child: Text(
                          'write_review'.tr,
                          style: poppinsMedium.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: Dimensions.fontSizeDefault),
                        ),
                      ),
                    ),
            ],
          ),
        ),
        //---------------------------------------------------------rating view
        const SizedBox(
          //height: 78,
          child: RatingView(),
        ),

        //--------------------------------------------------------------- review user list
        Column(
          children: List.generate(
              reviewList.length > 4 ? 4 : reviewList.length,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeDefault, vertical: 8),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withOpacity(0.06)),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(Dimensions.radiusSmall)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: Dimensions.paddingSizeDefault,
                            left: Dimensions.paddingSizeDefault,
                            top: Dimensions.paddingSizeDefault,
                            bottom: 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: Dimensions.paddingSizeSmall),
                                  child: CircleAvatar(
                                    radius: 20,
                                    child: ClipOval(
                                        child: Image.asset(
                                            Images.placeholderSquare)),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //------------------------------------------ student name
                                          Text(
                                            reviewList[index].user?.name ?? '',
                                            style: poppinsMedium.copyWith(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .color!,
                                                fontSize:
                                                    Dimensions.fontSizeDefault),
                                          ),
                                          //---------------------------------------- rating view
                                          Container(
                                            alignment: Alignment.center,
                                            height: 12,
                                            width: 72,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: int.parse(
                                                    reviewList[index].rating ??
                                                        '0'),
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: Dimensions
                                                            .paddingSizeMint),
                                                    child: SvgPicture.asset(
                                                        Images.starFill),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                      //-------------------------------------------date
                                      Text(
                                          "${DateTimeUtil.convertDateToWeekName(reviewList[index].date ?? '')}  |  ${reviewList[index].date ?? ''}",
                                          style: poppinsRegular.copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color!
                                                  .withOpacity(0.6),
                                              fontSize: Dimensions
                                                  .fontSizeExtraSmall)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            //--------------------------------------------------------comment
                            Text(
                              reviewList[index].comment ?? '',
                              style: poppinsMedium.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.6),
                                  fontSize: Dimensions.fontSizeSmall),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
        ),

        //--------------------------------------------------------------- show more button
        reviewList.isNotEmpty
            ? CustomButton(
                onPressed: () {
                  //navigate to the all review screen
                  Get.toNamed(RouteHelper.manageReviewScreen);
                },
                buttonText: 'Show more',
                width: 100,
                backgroundColor: const Color(0xFFF6F6F6),
                textColor: const Color(0xFF666666),
              )
            : const SizedBox()
      ],
    );
  }
}

