import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

class TitleWidget extends StatelessWidget {
  final String? title;
  final Function()? onTap;
 const  TitleWidget({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title!, style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),
      (onTap != null) ? InkWell(
        onTap: onTap,
        child: Text(
          'see_all'.tr,
          style: poppinsMedium.copyWith(
            decoration: TextDecoration.underline,
            color:Get.isDarkMode ?Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(.6) : Theme.of(context).colorScheme.primary,
            fontSize: Dimensions.fontSizeDefault, ),

        ),
      ) : const SizedBox(),
    ]);
  }
}
