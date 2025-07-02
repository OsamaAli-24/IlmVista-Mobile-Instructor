import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_image.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? backButton;
  final String profileImage;

  const HomeAppBar({super.key, this.backButton = true, this.profileImage = ''});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      leadingWidth: backButton! ? Dimensions.paddingSizeLarge : 0,
      leading: backButton!
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Theme.of(context).cardColor,
              onPressed: () => Navigator.pop(context),
            )
          : const SizedBox(),
      title: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: Dimensions.paddingSizeDefault,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.toNamed(RouteHelper.instructorProfileScreen);
                },
                borderRadius: BorderRadius.circular(30),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(Dimensions.radiusExtraLarge)),
                      //----------------------------------------------------profile image
                      child: CustomImage(height: 40, width: 40, image: profileImage),
                    ),
                    const SizedBox(
                      width: Dimensions.paddingSizeSmall,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SpaGreen Creative",
                          style: poppinsBold.copyWith(
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.w600,
                              fontSize: Dimensions.fontSizeDefault),
                        ),
                        Text(
                          "Evolution of Application Experience",
                          style: poppinsRegular.copyWith(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: Dimensions.fontSizeSmall),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              hoverColor: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              onTap: () => Get.toNamed(RouteHelper.notification),
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeRadius),
                child: SvgPicture.asset(
                  Images.notification,
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
