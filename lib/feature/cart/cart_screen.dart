import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/components/custom_button.dart';
import 'package:lms_user_app/components/loading_indicator.dart';
import 'package:lms_user_app/controller/cart_controller.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/feature/cart/widget/calculate_payment.dart';
import 'package:lms_user_app/feature/cart/widget/cart_item.dart';
import 'package:lms_user_app/utils/dimensions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'cart_item'.tr,
      ),
      body: GetBuilder<CartController>(
        builder: (cartController) {
          return cartController.isCartDataLoading == true
              ? const LoadingIndicator()
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cartController.cartList.length,
                  itemBuilder: (context, index) {
                    return CartItem(
                      cart: cartController.cartList[index],
                      index: index,
                    );
                  });
        },
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (controller) {
        return controller.isCartDataLoading == true
            ? const LoadingIndicator()
            : SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CalculatePayment(calculation: controller.calculations!),
                    Padding(
                      padding:
                          const EdgeInsets.all(Dimensions.paddingSizeDefault),
                      child: CustomButton(
                        onPressed: () {
                          Get.toNamed(RouteHelper.getCheekOutScreen());
                        },
                        buttonText: 'go_to_payment'.tr,
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSizeDefault,
                    )
                  ],
                ),
              );
      }),
    );
  }
}
