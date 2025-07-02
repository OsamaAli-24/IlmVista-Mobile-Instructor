import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class CourseTotalView extends StatelessWidget {
  final int totalEnrollment;
  final int totalLessons;
  const CourseTotalView({Key? key, this.totalEnrollment = 0, this.totalLessons = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.06),
                        width: 1),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Dimensions.radiusSmall)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'total_enrolment'.tr,
                              style: poppinsRegular.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.6),
                                  fontSize: Dimensions.fontSizeExtraSmall),
                            ),
                            SvgPicture.asset(Images.enrollment),
                          ],
                        ),
                        Text(
                          totalEnrollment.toString(),
                          style: poppinsSemiBold.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: Dimensions.fontSizeDefault),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: Dimensions.paddingSizeDefault),
              Expanded(
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.06),
                        width: 1),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Dimensions.radiusSmall)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'total_lessons'.tr,
                              style: poppinsRegular.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.6),
                                  fontSize: Dimensions.fontSizeExtraSmall),
                            ),
                            SvgPicture.asset(Images.totalEnrolment),
                          ],
                        ),
                        Text(
                          totalLessons.toString(),
                          style: poppinsSemiBold.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: Dimensions.fontSizeDefault),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
