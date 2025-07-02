import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/title_view.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class TopInstructor extends StatelessWidget {
  final String title;
  const TopInstructor({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleView(title: title.tr),
        const SizedBox(
          height: Dimensions.paddingSizeDefault,
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  height: 96,
                  width: 255,
                  margin: const EdgeInsets.only(
                      left: Dimensions.paddingSizeDefault),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    border: Border.all(
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.06),
                    ),
                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding:
                          const EdgeInsets.all(Dimensions.paddingSizeSmall),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: Dimensions.paddingSizeSmall),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 30,
                              child: ClipOval(
                                  child: Image.asset(
                                Images.placeholderSquare,
                                fit: BoxFit.contain,
                                height: 50,
                                width: 50,
                              )),
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
                                          .color,
                                      fontSize: Dimensions.fontSizeDefault),
                                ),
                                Text("General Math",
                                    style: poppinsRegular.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize:
                                            Dimensions.fontSizeExtraSmall)),
                                Text("BSC in EEE from Southeast University",
                                    style: poppinsRegular.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color!
                                            .withOpacity(0.6),
                                        fontSize: Dimensions.fontSizeSmall)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
