import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/controller/student_controller.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/data/model/instructor/instructor_student_list/student.dart';

import '../../components/custom_app_bar.dart';
import '../../utils/dimensions.dart';
import '../../utils/images.dart';
import '../../utils/styles.dart';

class StudentListScreen extends GetView<StudentController> {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'student_list'.tr,
        isBackButtonExist: false,
        centerTitle: false,
        bgColor: Theme.of(context).cardColor,
        titleColor: Theme.of(context).textTheme.bodyLarge!.color,
      ),
      body: Obx(() => SizedBox(
            child: controller.state.isStudentListLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.state.studentList.length,
                    itemBuilder: (context, index) {
                      return student(context, controller.state.studentList[index]);
                    }),
          )),
    );
  }

  Widget student(BuildContext context, Student student) {
    return InkWell(
      onTap: () => Get.toNamed(RouteHelper.studentProfileScreen, arguments: student.id),
      child: Container(
        width: Get.size.width,
        // height: 116,
        constraints: const BoxConstraints(),
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault,
            vertical: 8),
        margin: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault,
            vertical: Dimensions.paddingSizeExtraSmall),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.06),
          ),
          borderRadius:
              const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          //-----------------------------------------------student image
          leading: SizedBox(
            width: 44,
            height: 44,
            child: ClipOval(
              child: Image.network(
                student.image ?? '',
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  Images.placeholderSquare,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          //--------------------------------------------------- student name
          title: Text(
            student.name ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: poppinsSemiBold.copyWith(
                fontSize: Dimensions.fontSizeDefault,
                fontWeight: FontWeight.w600),
          ),

          subtitle: const Text('Student', style: TextStyle(color: Color(0xFF2357A4)),),
        )
      ),
    );
  }
}

/*
  Stack(
          alignment: Alignment.topLeft,
          children: [
            Positioned(
              child: SizedBox(
                width: 44,
                height: 44,
                child: ClipOval(
                  child: Image.network(
                    student.image ?? '',
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      Images.placeholderSquare,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                width: 20,
                height: 20,
                child: IconButton(
                    onPressed: () => null,
                    splashRadius: 20,
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset(Images.moreVert,
                        height: 10, width: 2)),
              ),
            ),
            Positioned(
              left: 55,
              top: 0,
              right: 0,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        student.name ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: poppinsSemiBold.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                      Image.asset(Images.flagOfBangladesh, width: 12, height: 8)
                    ],
                  ),
                  Text(
                    "Student Email",
                    style: poppinsRegular.copyWith(
                      fontSize: Dimensions.fontSizeExtraSmall,
                    ),
                  ),
                  Text(
                    "01521200319",
                    overflow: TextOverflow.ellipsis,
                    style: poppinsRegular.copyWith(
                      fontSize: Dimensions.fontSizeSmall,
                    ),
                  ),
                  Text(
                    "${'enrolled_course'.tr}: 4",
                    overflow: TextOverflow.ellipsis,
                    style: poppinsRegular.copyWith(
                      fontSize: Dimensions.fontSizeSmall,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
* */
