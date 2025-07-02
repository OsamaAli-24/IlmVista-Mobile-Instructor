
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/core/helper/help_me.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'meeting_list'.tr,
        bgColor: Theme.of(context).cardColor,
        titleColor: Theme.of(context).textTheme.bodyLarge!.color,
      ),
      body: ListView.builder(
        itemCount: 20,
          itemBuilder: (context,index){
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
                  border: Border.all(
                      color: Theme.of(context).primaryColorLight
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Padding(
                        padding: const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
                        child: CircleAvatar(
                          backgroundColor: randomColorPicker(),
                          radius: 20,
                          child: const Text("A"),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("E982457",
                                  style: poppinsMedium.copyWith(
                                      color: Theme.of(context).textTheme.bodyLarge!.color,
                                      fontSize: Dimensions.fontSizeDefault),
                                ),
                                Text("10 Feb 2023, 08:30pm",
                                  style: poppinsRegular.copyWith(
                                      color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                                      fontSize: Dimensions.fontSizeExtraSmall),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
                              ),
                              child: Padding(
                                padding:  const EdgeInsets.symmetric(
                                    horizontal: Dimensions.paddingSizeSmall,
                                    vertical: Dimensions.paddingSizeMint
                                ),
                                child: Text("Join",
                                  style: poppinsRegular.copyWith(
                                      color: Theme.of(context).cardColor,
                                      fontSize: Dimensions.fontSizeSmall
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
