import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lms_user_app/feature/common/course_widget.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../../data/model/common/course.dart';

class RelatedCourse extends StatelessWidget {
  final List<Course> courses;
  const RelatedCourse({Key? key, required this.courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return courses.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                child: Text(
                  'related_course'.tr,
                  style: poppinsSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeDefault),
                ),
              ),
              const SizedBox(
                height: Dimensions.paddingSizeDefault,
              ),
              SizedBox(
                height: 210,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: Dimensions.paddingSizeDefault),
                      child: CourseWidget(
                        course: courses.elementAt(index),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        : const SizedBox();
  }
}
