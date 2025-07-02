import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/data/model/course_detail/lesson.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../../data/model/course_detail/section.dart';

class CourseCurriculum extends StatelessWidget {
  final List<Section> sections;
  const CourseCurriculum({Key? key, required this.sections}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'course_curriculum'.tr,
            style:
                poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeDefault),
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
              itemCount: sections.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      bottom: Dimensions.paddingSizeSmall),
                  child: curriculumItem(context, sections[index]),
                );
              },
            ),
          ),
          //const SizedBox(height: 10,),
          //foldedItem(context),
        ],
      ),
    );
  }

  Container foldedItem(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border:
            Border.all(color: Theme.of(context).primaryColorLight, width: 1),
        color: Colors.white,
        borderRadius:
            const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Text(
                "How to Be More Polite with Your Words",
                style: poppinsMedium.copyWith(
                    color: Theme.of(context).textTheme.bodyLarge!.color!,
                    fontSize: Dimensions.fontSizeDefault),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container curriculumItem(BuildContext context, Section section) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color:
              Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06),
          width: 1,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(Dimensions.radiusSmall),
        ),
      ),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
        ),
        title: Text(
          section.title ?? '',
          style: poppinsMedium.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontSize: Dimensions.fontSizeDefault),
        ),
        children: [
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color:
                Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: section.lessons?.length ?? 0,
              itemBuilder: (context, index) {
                return _item(context, section.lessons![index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  /* Container curriculumItem(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
            color:
                Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06),
            width: 1),
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius:
            const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('basic_knowledge'.tr,
                    style: poppinsMedium.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: Dimensions.fontSizeDefault)),
                InkWell(
                  onTap: (){
                    Get.find<CourseDetailController>().curriculumButton();
                  },
                  child: Icon(
                    Get.find<CourseDetailController>().isSelect?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              ],
            ),
            Divider(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!
                  .withOpacity(0.06),
              thickness: 1,
            ),
            _item(context),
            _item(context),
          ],
        ),
      ),
    );
  }*/

  Padding _item(BuildContext context, Lesson lesson) {
    return Padding(
        padding:
            const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
        child: ListTile(
          leading: SvgPicture.asset(lesson.type != null
              ? lesson.type!.toLowerCase() == 'audio'
                  ? Images.audioFile
                  : lesson.type!.toLowerCase() == 'video'
                      ? Images.polygon
                      : Images.document
              : Images.starFill),
          title: Text(lesson.title ?? '',
              style: poppinsRegular.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!
                      .withOpacity(0.6),
                  fontSize: Dimensions.fontSizeSmall)),
          trailing: Text(
              lesson.isFree != null
                  ? lesson.isFree == true
                      ? "Free"
                      : "Paid"
                  : "",
              style: poppinsMedium.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Dimensions.fontSizeExtraSmall)),
        ));
  }
}

// Widget _leadingIcon(String icon) => SvgPicture.asset(icon);
