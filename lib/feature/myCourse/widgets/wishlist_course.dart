import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/loading_indicator.dart';
import 'package:lms_user_app/controller/wishlist_controller.dart';
import 'package:lms_user_app/core/helper/help_me.dart';
import 'package:lms_user_app/data/model/common/course.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class WishListCourse extends StatelessWidget {
  const WishListCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListController>(
        initState: (state) =>
            Get.find<WishListController>().getWishlistCourses(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeDefault),
            child: controller.isWishListDataLoading
                ? const LoadingIndicator()
                : mainUI(context, controller),
          );
        });
  }

  ListView mainUI(BuildContext context, WishListController controller) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.myWishList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Dimensions.paddingSizeExtraSmall),
            child: item(context, controller.myWishList[index]),
          );
        });
  }

  Container item(BuildContext context, Course course) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 1.2,
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!
                  .withOpacity(0.06)),
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                  Radius.circular(Dimensions.radiusSmall)),
              child: Image.network(
                course.thumbnail ?? '',
                width: 70,
                height: 80,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset(Images.placeholderSquare),
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              width: Dimensions.paddingSizeSmall,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width / 1.8,
                        child: Text(
                          course.title ?? "",
                          style: poppinsMedium.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                              fontSize: Dimensions.fontSizeDefault),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: Dimensions.paddingSizeRadius),
                        child: InkWell(
                          onTap: () => Get.find<WishListController>()
                              .removeFromWishList(course.id!, 'course'),
                          child: SvgPicture.asset(
                            Images.delete,
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withOpacity(0.6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimensions.paddingSizeExtraSmall),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Images.playSmall),
                            const SizedBox(
                              width: Dimensions.paddingSizeMint,
                            ),
                            Text(
                              "${course.totalLessons} ${'lessons'.tr}",
                              style: poppinsRegular.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.6),
                                  fontSize: Dimensions.fontSizeExtraSmall),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: Dimensions.paddingSizeSmall,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(Images.profileSmall),
                            const SizedBox(
                              width: Dimensions.paddingSizeMint,
                            ),
                            Text(
                              "${course.totalEnrolls} ${'enroll'.tr}",
                              style: poppinsRegular.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.6),
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
                        //"\$27.00",
                        calculateCoursePrice(course),
                        style: poppinsRegular.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: Dimensions.fontSizeSmall),
                      ),
                      Text(
                        'add_to_cart'.tr,
                        style: poppinsRegular.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: Dimensions.fontSizeSmall),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
