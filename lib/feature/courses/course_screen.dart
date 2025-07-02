import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/controller/course_controller.dart';
import 'package:lms_user_app/feature/courses/widget/course_card.dart';
import 'package:lms_user_app/feature/courses/widget/course_filter.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class CourseScreen extends StatelessWidget {
  final scaffoldState = GlobalKey<ScaffoldState>();

  CourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'courses'.tr,
              style: poppinsMedium.copyWith(
                  fontSize: Dimensions.fontSizeLarge,
                  color: Theme.of(context).primaryColorLight),
            ),
            //-----------------------------------------------filter button
            // IconButton(
            //   onPressed: () {
            //     showModalBottomSheet(
            //       context: context,
            //       isScrollControlled: true,
            //       builder: (context) => const CourseFilter(),
            //       backgroundColor: Colors.transparent,
            //     );
            //   },
            //   splashRadius: 20,
            //   icon: SvgPicture.asset(Images.appbarMenu,
            //       color: Theme.of(context).primaryColorLight),
            // ),
            // Your widgets here
          ],
        ),
      ),
      body: GetBuilder<CourseController>(
        builder: (controller) {
          controller.getInstructorCourseList();
          return Obx(() => SizedBox(
                child: controller.isFirstLoadRunning
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              controller: controller.scrollController,
                              physics: const BouncingScrollPhysics(),
                              itemCount: controller.instructorCourseList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    top: index == 0
                                        ? Dimensions.paddingSizeDefault
                                        : 0,
                                    bottom: Dimensions.paddingSizeDefault,
                                    left: Dimensions.paddingSizeDefault,
                                    right: Dimensions.paddingSizeDefault,
                                  ),
                                  child: CourseCard(
                                    course: controller.instructorCourseList[index],
                                  ),
                                );
                              }),
                        ),

                        // when the _loadMore function is running
                          Obx(() => controller.isLoadMoreRunning? const Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 40),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ): const SizedBox()),
                      ],
                    ),
              ));
        },
      ),
    );
  }
}
