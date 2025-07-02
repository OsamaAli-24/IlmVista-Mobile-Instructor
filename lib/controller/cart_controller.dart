import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_snackbar.dart';
import 'package:lms_user_app/data/model/cart_list/cart_list.dart';

import '../data/model/cart_list/calculations.dart';
import '../data/model/cart_list/cart.dart';
import '../repository/cart_repository.dart';

class CartController extends GetxController implements GetxService {
  bool isCartDataLoading = false;

  Future<void> clearCartList() async {}
  List<Cart> cartList = [];
  Calculations? calculations;

  //apply coupon
  int selectedCartItemIndex = -1;
  bool isApplyCouponLoading = false;
  final couponInputController = TextEditingController();
  bool isApplyCouponPressed(int index) {
    return index == selectedCartItemIndex;
  }

  void selectedIndex(int index) {
    selectedCartItemIndex = index;
    update(["cart"]);
  }

  @override
  void onInit() {
    getCartList();
    super.onInit();
  }

  Future<void> getCartList() async {
    isCartDataLoading = true;
    update();
    final response = await CartRepository(Get.find()).getCartList();
    if (response != null && response.statusCode == 200) {
      CartList cart = CartList.fromJson(response.body);
      calculations = cart.data!.calculations;
      cartList.clear();
      cartList.addAll(cart.data!.carts!);
    }
    isCartDataLoading = false;
    update();
  }

  Future<void> addToCart(int id, String type) async {
    isCartDataLoading = true;
    update();
    final response = await CartRepository(Get.find()).addToCart(id, type);
    if (response != null) {
      customSnackBar(response.body['message'], isError: false);
    }
    isCartDataLoading = false;
    update();
  }

  Future<void> applyCoupon(
      {required String code, required String type, required String id}) async {
    isApplyCouponLoading = true;
    update();
    final response = await CartRepository(Get.find())
        .applyCoupon(code: code, type: type, id: id);
    if (response != null && response.statusCode == 200) {
      customSnackBar(response.body['message'] ?? "", isError: false);
    } else {
      customSnackBar(
          response?.body['message'] ??
              response?.body['errors']['code'].toString(),
          isError: false);
    }
    await getCartList();
    isApplyCouponLoading = false;
    update();
  }
}
