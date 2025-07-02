import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_button.dart';
import 'package:lms_user_app/core/service/color_picker_service.dart';
import 'package:lms_user_app/utils/dev_util.dart';

class AppColorPicker extends StatelessWidget {
  const AppColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.all(12),
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(),
      child: Container(
        width: double.infinity,
        height: size.height * 0.6,
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            // SingleChildScrollView(
            //   child: ColorPicker(
            //     pickerColor: Color(ColorPickerService.to.selectedColor),
            //     onColorChanged: ColorPickerService.to.changeColor,
            //     labelTypes: const [
            //       ColorLabelType.hex,
            //       ColorLabelType.rgb,
            //       ColorLabelType.hsv
            //     ],
            //   ),
            // ),
            Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      onPressed: (){
                        Navigator.pop(context);
                        appLog(tag: 'Selected Color', msg: ColorPickerService.to.selectedColor);
                      },
                      width: 100,
                        buttonText: 'Pick',
                      backgroundColor: Colors.green[900],
                    ),

                    CustomButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      width: 100,
                      buttonText: 'Cancel',
                      backgroundColor: Colors.red[900],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
