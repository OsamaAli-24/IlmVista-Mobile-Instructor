import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

class CourseInformation extends StatelessWidget {
  //final OrganizationProfileData profileData;
  const CourseInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: Dimensions.paddingSizeSmall,
                left: Dimensions.paddingSizeSmall),
            child: cardWidget(
                context,
                // profileData.totalCourse?.toString() ?? "0",
                "22",
                'total_course'.tr),
          ),
          Padding(
            padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
            child: cardWidget(
                context,
                //profileData.totalInstructor?.toString() ?? "0",
                "4",
                'total_instructor'.tr),
          ),
          Padding(
            padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
            child: cardWidget(
                context,
                // profileData.totalStudents?.toString() ?? "0",
                "420",
                'total_students'.tr),
          ),
          Padding(
            padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
            child: cardWidget(
                context,
                //profileData.totalEnrollments?.toString() ?? "0",
                "420",
                'total_enrollments'.tr),
          ),
        ],
      ),
    );
  }

  Widget cardWidget(context, String total, String title) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColorLight),
          borderRadius: const BorderRadius.all(
              Radius.circular(Dimensions.paddingSizeExtraSmall))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: poppinsRegular.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withOpacity(0.6),
                fontSize: Dimensions.fontSizeSmall),
          ),
          const SizedBox(
            width: Dimensions.paddingSizeSmall,
          ),
          Text(
            total,
            style: poppinsSemiBold.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: Dimensions.fontSizeSmall),
          ),
        ],
      ),
    );
  }
}
