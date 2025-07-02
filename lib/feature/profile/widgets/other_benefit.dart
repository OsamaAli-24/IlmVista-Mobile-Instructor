import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/feature/profile/widgets/user_logout.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class OtherBenefit extends StatelessWidget {
  OtherBenefit({Key? key}) : super(key: key);

  final List list = [
    {"icon": Images.certificates, "title": 'certificates'.tr},
    {"icon": Images.books, "title": 'books'.tr},
    {"icon": Images.favorite, "title": 'favorite'.tr},
    {"icon": Images.profileNotification, "title": 'notification'.tr},
    {"icon": Images.orderHistory, "title": 'orderHistory'.tr},
    {"icon": Images.voucher, "title": 'voucher'.tr},
    {"icon": Images.meeting, "title": 'meeting'.tr},
    {"icon": Images.changePassword, "title": 'changePassword'.tr},
    {"icon": Images.profileLogout, "title": 'logout'.tr},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.paddingSizeDefault,
                right: Dimensions.paddingSizeDefault,
                top: Dimensions.paddingSizeDefault),
            child: Text(
              'otherBenefit'.tr,
              style: poppinsSemiBold.copyWith(
                  fontSize: Dimensions.fontSizeDefault),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: list.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if (index == 0) {
                              Get.toNamed(RouteHelper.certificateScreen);
                            } else if (index == 3) {
                              Get.toNamed(RouteHelper.orderHistoryScreen);
                            } else if (index == 4) {
                              Get.toNamed(RouteHelper.couponScreen);
                            } else if (index == 5) {
                              Get.toNamed(RouteHelper.meetingScreen);
                            } else if (index == 7) {
                              Get.toNamed(RouteHelper.changePasswordScreen);
                            } else if (index == 8) {
                              Get.bottomSheet(const UserLogout(),
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: Dimensions.paddingSizeRadius),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  list[index]['icon'],
                                  height: 14,
                                  width: 12,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  list[index]['title'],
                                  style: poppinsRegular.copyWith(
                                      fontSize: Dimensions.fontSizeSmall),
                                ),
                              ],
                            ),
                          ),
                        ),
                        (index + 1) == (list.length)
                            ? const SizedBox()
                            : Divider(
                                thickness: 1,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                              ),
                        (index + 1) == (list.length)
                            ? Align(
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Dimensions.paddingSizeSmall,
                                        vertical:
                                            Dimensions.paddingSizeExtraSmall),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(Images.deleteAccount),
                                        const SizedBox(
                                          width:
                                              Dimensions.paddingSizeExtraSmall,
                                        ),
                                        Text('deleteYourAccount'.tr,
                                            style: poppinsRegular.copyWith(
                                                fontSize:
                                                    Dimensions.fontSizeSmall,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error)),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
