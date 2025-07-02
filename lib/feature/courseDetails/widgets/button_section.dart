import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_button.dart';
import 'package:lms_user_app/components/loading_indicator.dart';
import 'package:lms_user_app/controller/cart_controller.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../../data/model/course_detail/data.dart';

class ButtonSection extends StatelessWidget {
  final CourseDetailData data;
  const ButtonSection({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 122,
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                data.contactNo!.isEmpty
                    ? const SizedBox()
                    : Row(
                        children: [
                          Text(
                            "${'contact'.tr}:",
                            style: poppinsRegular.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color!,
                                fontSize: Dimensions.fontSizeSmall),
                          ),
                          const SizedBox(
                            width: Dimensions.paddingSizeExtraSmall,
                          ),
                          SvgPicture.asset(Images.phone),
                          const SizedBox(
                            width: Dimensions.paddingSizeExtraSmall,
                          ),
                          Text(
                            data.contactNo!,
                            style: poppinsRegular.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: Dimensions.fontSizeSmall),
                          ),
                        ],
                      ),
                Row(
                  children: [
                    if (data.isDiscounted == true)
                      Text(
                        "\$${data.discountedPrice}",
                        style: poppinsSemiBold.copyWith(
                            color:
                                Theme.of(context).textTheme.bodyLarge!.color!,
                            fontSize: Dimensions.fontSizeLarge),
                      ),
                    const SizedBox(
                      width: Dimensions.paddingSizeRadius,
                    ),
                    Text(
                      data.price == "Free" ? "Free" : "\$${data.price}",
                      style: poppinsRegular.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge!.color!,
                          fontSize: Dimensions.fontSizeSmall,
                          decoration: data.isDiscounted == true
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: Dimensions.paddingSizeLarge),
            GetBuilder<CartController>(
                init: CartController(),
                builder: (cartController) {
                  return cartController.isCartDataLoading == true
                      ? const LoadingIndicator()
                      : CustomButton(
                          onPressed: () {
                            cartController.addToCart(data.id!, 'course');
                            //Get.toNamed(RouteHelper.getCartScreen());
                          },
                          buttonText: "add_to_cart".tr,
                        );
                }),
            const SizedBox(height: Dimensions.paddingSizeDefault),
          ],
        ),
      ),
    );
  }
}
