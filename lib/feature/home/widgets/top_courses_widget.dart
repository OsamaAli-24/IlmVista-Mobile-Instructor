import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lms_user_app/components/title_view.dart';
import 'package:lms_user_app/feature/common/course_widget.dart';
import 'package:lms_user_app/utils/dimensions.dart';

import '../../../data/model/common/course.dart';

class TopCourseWidget extends StatelessWidget {
  final List<Course> list;
  const TopCourseWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleView(title: 'top_courses'.tr),
        const SizedBox(
          height: Dimensions.paddingSizeDefault,
        ),
        SizedBox(
          height: 197,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    right: Dimensions.paddingSizeDefault,
                    left: index == 0 ? Dimensions.paddingSizeDefault : 0),
                child:  CourseWidget(course: list.elementAt(index)),
              );
            },
          ),
        )
      ],
    );
  }
}
