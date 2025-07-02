import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/controller/instructor_controller.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class FollowMessage extends StatelessWidget {
  final int id;
  const FollowMessage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InstructorController>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (controller.isFollowing == false)
            followButton(context, controller),
          if (controller.isFollowing == true)
            unfollowButton(context, controller),
          const SizedBox(width: Dimensions.paddingSizeDefault),
          messageButton(context)
        ],
      );
    });
  }

  Container messageButton(BuildContext context) {
    return Container(
      width: 110,
      height: 32,
      decoration: BoxDecoration(
          //color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
          border: Border.all(color: Theme.of(context).colorScheme.primary)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Images.message),
          const SizedBox(width: Dimensions.paddingSizeSmall),
          Text(
            "message".tr,
            style: poppinsMedium.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: Dimensions.fontSizeSmall),
          )
        ],
      ),
    );
  }

  InkWell followButton(BuildContext context, InstructorController controller) {
    return InkWell(
      onTap: () => controller.followUnfollow(id),
      radius: Dimensions.radiusLarge,
      child: Container(
        width: 110,
        height: 32,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(Dimensions.radiusLarge)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Images.follow),
            const SizedBox(width: Dimensions.paddingSizeSmall),
            Text('follow'.tr,
                style: poppinsMedium.copyWith(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: Dimensions.fontSizeSmall))
          ],
        ),
      ),
    );
  }

  InkWell unfollowButton(
      BuildContext context, InstructorController controller) {
    return InkWell(
      onTap: () => controller.followUnfollow(id),
      radius: Dimensions.radiusLarge,
      child: Container(
        width: 110,
        height: 32,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(Dimensions.radiusLarge)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Images.unfollow),
            const SizedBox(width: Dimensions.paddingSizeSmall),
            Text('unfollow'.tr,
                style: poppinsMedium.copyWith(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: Dimensions.fontSizeSmall))
          ],
        ),
      ),
    );
  }
}
