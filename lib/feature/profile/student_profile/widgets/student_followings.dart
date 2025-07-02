import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_image.dart';
import 'package:lms_user_app/controller/student_controller.dart';
import 'package:lms_user_app/data/model/student/following_data_model.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class FollowingInstructor extends GetView<StudentController> {
  final List<Following> following;
  const FollowingInstructor({super.key, required this.following});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: following.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeDefault, vertical: 8),
            // width: width,
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
              child: SizedBox(
                // height: 80,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipOval(
                          //----------------------------------------------------------------thumbnail
                          child: CustomImage(
                            width: 80,
                            height: 80,
                            image: following[index].image ?? '',
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
                              //------------------------------------------------------title
                              Text(
                                following[index].name ?? '',
                                style: poppinsMedium.copyWith(
                                    fontSize: Dimensions.fontSizeSemiSmall),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // const SizedBox(height: Dimensions.paddingSizeSmall,),
                              //-----------------------------------------------------name
                              const Gap(6),

                              //----------------------------------------------------lessons
                              Text(
                                following[index].designation ?? '',
                                style: poppinsRegular.copyWith(
                                  fontSize: Dimensions.fontSizeSmall,
                                  color: const Color(0xFF2357A4),
                                ),
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
          ),
        ));
  }
}
