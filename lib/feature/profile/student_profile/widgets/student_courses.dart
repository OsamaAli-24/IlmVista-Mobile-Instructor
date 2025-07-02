import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_image.dart';
import 'package:lms_user_app/controller/student_controller.dart';
import 'package:lms_user_app/data/model/student/student_course_data_model.dart';
import 'package:lms_user_app/utils/dev_util.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class StudentCourses extends GetView<StudentController> {
  final List<StudentCoursesData> courses;
  const StudentCourses({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    appLog(tag: "Digit", msg: extractAndConcatenateDigits('ashiq2002@pt1'));
    return Scaffold(
        body: ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault, vertical: 8),
        // width: width,
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!
                  .withOpacity(0.06),
              width: 1),
          borderRadius:
              const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: SizedBox(
            // height: 80,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(Dimensions.radiusSmall)),
                      //----------------------------------------------------------------thumbnail
                      child: CustomImage(
                        width: 70,
                        height: 80,
                        image: courses[index].thumbnail ?? '',
                        placeholder: Images.placeholderSquare,
                      ),
                    ),
                    const SizedBox(
                      width: Dimensions.paddingSizeSmall,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //------------------------------------------------------title
                          Text(
                            courses[index].title ?? '',
                            style: poppinsMedium.copyWith(
                                fontSize: Dimensions.fontSizeSemiSmall),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // const SizedBox(height: Dimensions.paddingSizeSmall,),
                          //-----------------------------------------------------name
                          const Gap(15),

                          //----------------------------------------------------lessons
                          Text(
                            "${courses[index].completedLessons ?? 0 } Lessons / ${courses[index].totalLessons ?? 0 } Lessons",
                            style: poppinsRegular.copyWith(
                              fontSize: Dimensions.fontSizeSmall,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .color!
                                  .withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //------------------------------------------------progress
                const Gap(6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //------------------------------------------------percentage text
                    Text('${courses[index].completedPercentage}'),
                    const Gap(8),

                    //----------------------------------------------- percentage progress
                    SizedBox(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(10),
                          minHeight: 8,
                          value: calculatePercentage(
                              int.parse(extractAndConcatenateDigits(
                                  courses[index].completedPercentage ?? '0')),
                              100),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0x4C2357A4)),
                          backgroundColor: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color!
                              .withOpacity(0.06),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

double calculatePercentage(int reviewCount, int totalReview) {
  return reviewCount == 0 || totalReview == 0
      ? 0.0
      : (reviewCount * 100) / totalReview / 100;
  // : (reviewCount * 100) / 30 / 100;
}

// Extracting digits using regular expressions
String extractAndConcatenateDigits(String str) {
  // Extracting all digits using regular expression
  Iterable<RegExpMatch> matches = RegExp(r'\d').allMatches(str);
  // Concatenating all digits into a single string
  return matches.map((match) => match.group(0)!).join();
}
