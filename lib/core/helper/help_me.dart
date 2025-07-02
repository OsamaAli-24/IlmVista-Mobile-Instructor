import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../data/model/cart_list/cart.dart';
import '../../data/model/common/book.dart';
import '../../data/model/common/course.dart';

const kLOG_TAG = "[LMS-Faculty]";
const kLOG_ENABLE = true;
DateTime? loginClickTime;

printLog(dynamic data) {
  if (kLOG_ENABLE) {
    if (kDebugMode) {
      print("$kLOG_TAG${data.toString()}");
    }
  }
}

String calculateCoursePrice(Course course) {
  if (course.isFree!) {
    return "free".tr;
  } else {
    if (course.isDiscounted!) {
      return "\$${course.discountedPrice.toString()}";
    } else {
      return "\$${course.price.toString()}";
    }
  }
}

String calculateBookPrice(BookModel book) {
  if (book.isFree == true) {
    return 'free'.tr;
  } else {
    if (book.isDiscounted == true) {
      return "\$${book.discountedPrice.toString()}";
    } else {
      return '\$${book.price}';
    }
  }
}

String calculateCartPrice(Cart cart) {
  if (cart.isFree == true) {
    return 'free'.tr;
  } else {
    if (cart.isDiscounted == true) {
      return "\$${cart.discountedPrice.toString()}";
    } else {
      return '\$${cart.price}';
    }
  }
}

bool isRedundentClick(DateTime currentTime) {
  if (loginClickTime == null) {
    loginClickTime = currentTime;
    return false;
  }
  if (currentTime.difference(loginClickTime!).inSeconds < 3) {
    return true;
  }

  loginClickTime = currentTime;
  return false;
}

Color randomColorPicker() {
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
