import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_button.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

class DeleteAccountDialog extends StatelessWidget {
  final Function()? onCancel;
  final Function()? onDelete;

  const DeleteAccountDialog({super.key, this.onCancel, this.onDelete, });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: size.height * 0.25,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        constraints: const BoxConstraints(),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //--------------------------------------------title
                Text('Are You Sure?'.tr,
                    style: poppinsSemiBold.copyWith(
                        color: const Color(0xFF2357A4),
                        fontSize: Dimensions.fontSizeExtraLarge,
                        height: 3)),

                //--------------------------------------------sub title
                Text(
                  'Do you really want to delete account? This process cannot be undone.'
                      .tr,
                  textAlign: TextAlign.center,
                  style: poppinsRegular.copyWith(
                    color: const Color(0xFF333333),
                    fontSize: Dimensions.fontSizeSmall,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 8,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //--------------------------------------------------cancel button
                  CustomButton(
                    onPressed: onCancel,
                    buttonText: 'Cancel',
                    width: size.width * 0.3,
                    backgroundColor: const Color(0xFFEEEEEE),
                    textColor: const Color(0xFF333333),
                  ),
                  //-------------------------------------------------delete button
                  CustomButton(
                    onPressed: onDelete,
                    buttonText: 'Delete',
                    width: size.width * 0.3,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
