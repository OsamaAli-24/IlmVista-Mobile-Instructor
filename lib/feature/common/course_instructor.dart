import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/title_view.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../data/model/common/instructor.dart';

class CourseInstructor extends StatelessWidget {
  final String title;
  final List<Instructor> instructors;
  const CourseInstructor(
      {Key? key, required this.instructors, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleView(title: title.tr, isViewAllEnabled: false,),
        const SizedBox(
          height: Dimensions.paddingSizeDefault,
        ),
        SizedBox(
          height: 110,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: instructors.length,
              itemBuilder: (context, index) {
                Instructor instructor = instructors.elementAt(index);
                return Container(
                  constraints: const BoxConstraints(
                  ),
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  margin: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    border:
                        Border.all(color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06),),
                    borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInstructorDetails(),
                          arguments: instructor.id);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 30,
                            child: ClipOval(
                                child: Image.network(
                              instructor.image ?? "",
                              fit: BoxFit.contain,
                              height: 50,
                              width: 50,
                            )),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              instructor.name ?? "",
                              style: poppinsMedium.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                  fontSize: Dimensions.fontSizeDefault),
                            ),
                            Text(instructor.instructor ?? "",
                                style: poppinsRegular.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontSize:
                                        Dimensions.fontSizeExtraSmall)),
                            Container(
                              width: 220,
                              margin: const EdgeInsets.only(top: 4),
                              child: Text(instructor.about ?? "", maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: poppinsRegular.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!.withOpacity(0.6),
                                      fontSize: Dimensions.fontSizeSmall)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
