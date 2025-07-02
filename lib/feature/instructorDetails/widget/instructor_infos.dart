import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/data/model/instructor/Instructor_profile_data.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';
import 'package:text_scroll/text_scroll.dart';

class InstructorInfo extends StatelessWidget {
  final InstructorProfileData? data;
  const InstructorInfo({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          infoCard(context, "${data?.totalCourse ?? 0}", 'course'.tr),
          infoCard(context, "${data?.totalStudent ?? 0}", 'student'.tr),
          infoCard(context, "${data?.followers ?? 0}", 'follower'.tr),
          Container(
            height: 70,
            width: 75,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
              borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.network(
                      //Images.logo,
                      data?.organizationName?.logo ?? '',
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset(Images.placeholderSquare),
                    )),
                const SizedBox(
                  height: 5,
                ),
                TextScroll(data?.organizationName?.name ?? "",
                    velocity: const Velocity(pixelsPerSecond: Offset(15, 0)),
                    style: poppinsRegular.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.5),
                        fontSize: Dimensions.fontSizeSmall)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget infoCard(context, String total, String title) {
    return Container(
      height: 70,
      width: 75,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
        borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(total,
              style: poppinsMedium.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Dimensions.fontSizeDefault)),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall),
          Text(title,
              style: poppinsRegular.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.5),
                  fontSize: Dimensions.fontSizeSmall))
        ],
      ),
    );
  }
}
