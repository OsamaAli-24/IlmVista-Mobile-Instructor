import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_image.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/data/model/home_data_model/home_data_model.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../../utils/dimensions.dart';

class EnrollmentCard extends StatelessWidget {
  final double? width;
  final LatestEnrolls? latestEnrolls;

  const EnrollmentCard({Key? key, this.width, this.latestEnrolls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> Get.toNamed(RouteHelper.getCourseDetailsScreenRoute(), arguments: latestEnrolls?.id),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
              color:
                  Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06),
              width: 1),
          borderRadius:
              const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
                  //----------------------------------------------------------------thumbnail
                  child: CustomImage(
                    width: 70,
                    height: 80,
                    image: latestEnrolls?.thumbnail ?? Images.placeholderSquare,
                    placeholder: Images.placeholderSquare,
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
                      //------------------------------------------------------title
                      Text(
                        latestEnrolls?.title ?? 'Mathematics with Animated Lessons with Animated Lessons..',
                        style: poppinsMedium.copyWith(
                            fontSize: Dimensions.fontSizeSemiSmall),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // const SizedBox(height: Dimensions.paddingSizeSmall,),
                      //-----------------------------------------------------name
                      Text(
                        "Purchased by: Senegal Janio",
                        style: poppinsRegular.copyWith(
                          fontSize: Dimensions.fontSizeSmall,
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color!
                              .withOpacity(0.5),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //----------------------------------------------------- date
                          Text(
                            latestEnrolls?.purchasedDate ?? "20 Feb 2023",
                            style: poppinsRegular.copyWith(
                                fontSize: Dimensions.fontSizeSmall,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'paid'.tr,
                                style: poppinsSemiBold.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontSize: Dimensions.fontSizeSmall),
                              )),
                        ],
                      ),
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
