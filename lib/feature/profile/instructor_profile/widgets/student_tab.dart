import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/data/model/instructor/instructor_student_list/student.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';

class StudentTab extends StatelessWidget {
  final List<Student>? studentList;

  const StudentTab({super.key, this.studentList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: studentList?.length ?? 100,
      itemBuilder: (context, index) => studentItem(context, studentList?[index]),
    );
  }

  Widget studentItem(BuildContext context, Student? student) => ListTile(
        leading: ClipRRect(
            borderRadius: const BorderRadius.all(
                Radius.circular(Dimensions.radiusExtraMoreLarge)),
            child: Image.network(
              student?.image ?? '',
              height: 44,
              width: 44,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                Images.placeholderSquare,
                height: 44,
                width: 44,
              ),
              fit: BoxFit.cover,
            )),
        title: Text(
          student?.name ?? "Student Name",
          style: poppinsMedium.copyWith(
            fontSize: Dimensions.fontSizeSemiSmall,
          ),
        ),
        subtitle: Text(
          "student".tr,
          style: poppinsRegular.copyWith(
              color: Theme.of(context).primaryColor,
              fontSize: Dimensions.fontSizeSmall),
        ),
        //----------------------------------------- if need conversation icon then uncomment the code
        // trailing: SvgPicture.asset(
        //   Images.conversation,
        //   color: Theme.of(context).primaryColor,
        // ),
      );
}
