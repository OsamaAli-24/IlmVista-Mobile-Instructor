import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_image.dart';
import 'package:lms_user_app/components/title_view.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/data/model/home_data_model/home_data_model.dart';
import 'package:lms_user_app/feature/home/widgets/enrollment_card.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class RecentEnrollment extends StatelessWidget {
  final String title;
  final List<LatestEnrolls>? latestEnrolls;
  const RecentEnrollment({Key? key, required this.title, this.latestEnrolls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //------------------------------------------recent enrollment view all
        TitleView(title: title, onViewAll: (){ 
          // navigate to the enrollment screen
          Get.toNamed(RouteHelper.enrollmentScreen, arguments: true); // argument true for showing back button top on the enrollment screen
        },),
        const SizedBox(
          height: Dimensions.paddingSizeDefault,
        ),
        SizedBox(
          height: 110,
          child: latestEnrolls != null && latestEnrolls!.isNotEmpty? ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: Dimensions.paddingSizeDefault,
                      left: index == 0 ? Dimensions.paddingSizeDefault : 0),
                  child: EnrollmentCard(
                    width: 315,
                    latestEnrolls: latestEnrolls?[index],
                  ),
                );
              }): const Center(child: Text("No Recent Enrollment"),),
        ),
      ],
    );
  }

  Widget bookItem(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: Dimensions.paddingSizeDefault,
          left: index == 0 ? Dimensions.paddingSizeDefault : 0),
      child: Container(
        width: 315,
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!
                  .withOpacity(0.06),
              width: 1),
          borderRadius:
              const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    //borderRadius: BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
                    child: CustomImage(
                      width: 50,
                      height: 75,
                      image: Images.demoCourseImage,
                      placeholder: Images.placeholderSquare,
                    ),
                  ),
                  const SizedBox(
                    width: Dimensions.paddingSizeSmall,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mathematics with Animated Lessons..',
                          style: poppinsMedium.copyWith(
                              fontSize: Dimensions.fontSizeSemiSmall),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // const SizedBox(height: Dimensions.paddingSizeSmall,),
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
                            Text(
                              "20 Feb 2023",
                              style: poppinsRegular.copyWith(
                                  fontSize: Dimensions.fontSizeSmall,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'paid'.tr,
                                  style: poppinsSemiBold.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: Dimensions.fontSizeSmall),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
