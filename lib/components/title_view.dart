import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

class TitleView extends StatelessWidget {

  final String title;
  final bool? isViewAllEnabled;
  final void Function()? onViewAll;

  const TitleView({Key? key, required this.title, this.isViewAllEnabled = true, this.onViewAll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeDefault),
          ),
          if (isViewAllEnabled == true)
            InkWell(
              onTap: onViewAll,
              child: Text(
                'view_all'.tr,
                style: poppinsRegular.copyWith(
                    fontSize: Dimensions.fontSizeExtraSmall,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
        ],
      ),
    );
  }
}
