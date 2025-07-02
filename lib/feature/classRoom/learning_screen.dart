import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/components/custom_button.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/feature/classRoom/widget/video_player.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Learning Screen",
      ),
      body: Column(
        children: [
          Container(
            //height: 200,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            color: Colors.orange.withOpacity(0.2),
            child: const CourseVideoPlayer(),
          ),
          const SizedBox(
            height: Dimensions.paddingSizeDefault,
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('expressions_for_discussion'.tr,
                  style: poppinsSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeDefault),
                ),
                const SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                //curriculumItem(context),
                SizedBox(
                  //height: 400,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom:Dimensions.paddingSizeSmall
                        ),
                        child: curriculumItem(context),
                      );
                    },
                  ),
                ),
                //const SizedBox(height: 10,),
                //foldedItem(context),
              ],
            ),
          ),
          const SizedBox(height: Dimensions.paddingSizeDefault),
          Padding(
            padding: const EdgeInsets.all(15),
            child: CustomButton(
              onPressed: (){
                Get.toNamed(RouteHelper.quizStartPage);
              },
              buttonText: "Quiz",
            ),
          ),
        ],
      ),
    );
  }
  Container curriculumItem(BuildContext context){
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06),
          width: 1,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall),
        ),
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
        ),
        title: Text('basic_knowledge'.tr,
          style: poppinsMedium.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontSize: Dimensions.fontSizeDefault),
        ),
        children: [
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context)
                .textTheme
                .bodyLarge!
                .color!
                .withOpacity(0.06),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context,index){
                return _item(context);
              },
            ),
          ),
        ],
      ),
    );
  }
  Padding _item(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(Images.polygon),
              const SizedBox(width: 15),
              Text('Course Introduction',
                  style: poppinsRegular.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.6),
                      fontSize: Dimensions.fontSizeSmall)),
            ],
          ),
          Text("Free",
              style: poppinsMedium.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Dimensions.fontSizeExtraSmall)),
        ],
      ),
    );
  }
}
