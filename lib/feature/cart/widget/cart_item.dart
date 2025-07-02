import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/loading_indicator.dart';
import 'package:lms_user_app/controller/cart_controller.dart';
import 'package:lms_user_app/core/helper/help_me.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../../data/model/cart_list/cart.dart';

class CartItem extends StatelessWidget {
  final Cart cart;
  final int index;
  const CartItem({Key? key, required this.cart, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<CartController>(
        id: 'cart',
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault,
              vertical: Dimensions.paddingSizeSmall,
            ),
            child: Container(
              width: width,
              //height: 110,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.06)),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(Dimensions.radiusSmall))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: Dimensions.paddingSizeDefault,
                            top: Dimensions.paddingSizeDefault,
                            bottom: Dimensions.paddingSizeDefault),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(Dimensions.radiusSmall)),
                          child: Image.network(
                            cart.thumbnail ?? '',
                            width: 70,
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.all(Dimensions.paddingSizeSmall),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cart.title ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: poppinsMedium.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color,
                                    fontSize: Dimensions.fontSizeDefault),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: Dimensions.paddingSizeExtraSmall),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(Images.playSmall),
                                        const SizedBox(
                                          width: Dimensions.paddingSizeMint,
                                        ),
                                        Text(
                                          "${cart.totalLessons} ${'lessons'.tr}",
                                          style: poppinsRegular.copyWith(
                                              fontSize:
                                                  Dimensions.fontSizeExtraSmall,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color!
                                                  .withOpacity(0.5)),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          Images.profileSmall,
                                          height: 10,
                                        ),
                                        const SizedBox(
                                          width: Dimensions.paddingSizeMint,
                                        ),
                                        Text(
                                          "${cart.totalEnrolls} ${'enroll'.tr}",
                                          style: poppinsRegular.copyWith(
                                              fontSize:
                                                  Dimensions.fontSizeExtraSmall,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color!
                                                  .withOpacity(0.5)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${cart.price}",
                                    style: poppinsRegular.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color!
                                            .withOpacity(0.5),
                                        decoration: TextDecoration.lineThrough,
                                        fontSize:
                                            Dimensions.fontSizeExtraSmall),
                                  ),
                                  Text(
                                    calculateCartPrice(cart),
                                    style: poppinsRegular.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: Dimensions.fontSizeSmall),
                                  ),
                                  if (cart.couponApplied == false)
                                    TextButton(
                                      onPressed: () =>
                                          controller.selectedIndex(index),
                                      child: Text(
                                        'apply_coupon'.tr,
                                        style: poppinsSemiBold.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontSize:
                                                Dimensions.fontSizeExtraSmall),
                                      ),
                                    ),
                                  if (cart.couponApplied == true)
                                    Column(
                                      children: [
                                        Text(
                                          cart.couponCode ?? '',
                                          style: poppinsSemiBold.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: Dimensions
                                                  .fontSizeExtraSmall),
                                        ),
                                        Text(
                                          'applied_coupon'.tr,
                                          style: poppinsSemiBold.copyWith(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .color!
                                                  .withOpacity(0.5),
                                              fontSize: Dimensions
                                                  .fontSizeExtraSmall),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  if (controller.isApplyCouponPressed(index))
                    cart.couponApplied == false
                        ? Column(
                            children: [
                              Divider(
                                thickness: 1,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color!
                                    .withOpacity(0.06),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: Dimensions.paddingSizeDefault,
                                    left: Dimensions.paddingSizeDefault,
                                    right: Dimensions.paddingSizeDefault,
                                    top: Dimensions.paddingSizeExtraSmall),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color!
                                              .withOpacity(0.06)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                              Dimensions.radiusSmall))),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          autofocus: false,
                                          controller:
                                              controller.couponInputController,
                                          style: const TextStyle(
                                            fontSize:
                                                Dimensions.paddingSizeDefault,
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Coupon Code',
                                            filled: true,
                                            fillColor:
                                                Theme.of(context).cardColor,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => controller.applyCoupon(
                                            code: controller
                                                .couponInputController.text,
                                            type: cart.type ?? '',
                                            id: cart.id.toString()),
                                        child: Container(
                                          width: 88,
                                          height: 47,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius: const BorderRadius
                                                      .only(
                                                  topRight: Radius.circular(
                                                      Dimensions.radiusSmall),
                                                  bottomRight: Radius.circular(
                                                      Dimensions.radiusSmall))),
                                          child: controller.isApplyCouponLoading
                                              ? const LoadingIndicator(
                                                  color: Colors.white,
                                                )
                                              : Text(
                                                  'apply'.tr,
                                                  style: poppinsRegular.copyWith(
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                      fontSize: Dimensions
                                                          .fontSizeSmall),
                                                ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        : const SizedBox(),
                ],
              ),
            ),
          );
        });
  }
}
