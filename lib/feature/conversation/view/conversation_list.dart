import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class ConversationList extends StatelessWidget {
  const ConversationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "conversation".tr,
        bgColor: Theme.of(context).cardColor,
        titleColor: Theme.of(context).textTheme.bodyLarge!.color!,
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: Dimensions.paddingSizeDefault,
                right: Dimensions.paddingSizeDefault,
                bottom: Dimensions.paddingSizeExtraSmall,
                top: index != 0
                    ? Dimensions.paddingSizeExtraSmall
                    : Dimensions.paddingSizeDefault,
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.06),
                      width: 1),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(Dimensions.radiusSmall)),
                ),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(RouteHelper.conversationScreen);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: Dimensions.paddingSizeSmall),
                          child: CircleAvatar(
                            radius: 25,
                            child: ClipOval(
                                child: Image.asset(Images.placeholderSquare)),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hellio Jamsh",
                                style: poppinsMedium.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!,
                                    fontSize: Dimensions.fontSizeDefault),
                              ),
                              const SizedBox(
                                height: Dimensions.paddingSizeSmall,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Thank you so much..",
                                      style: poppinsRegular.copyWith(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color!
                                              .withOpacity(0.6),
                                          fontSize:
                                              Dimensions.fontSizeExtraSmall)),
                                  Text("1 minute ago",
                                      style: poppinsRegular.copyWith(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color!
                                              .withOpacity(0.6),
                                          fontSize:
                                              Dimensions.fontSizeExtraSmall)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
