import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/components/loading_indicator.dart';
import 'package:lms_user_app/controller/course_detail_controller.dart';
import 'package:lms_user_app/controller/review_controller.dart';
import 'package:lms_user_app/controller/video_player_controller.dart';
import 'package:lms_user_app/feature/classRoom/widget/video_player.dart';
import 'package:lms_user_app/feature/courseDetails/widgets/course_curriculum.dart';
import 'package:lms_user_app/feature/courseDetails/widgets/course_features.dart';
import 'package:lms_user_app/feature/common/course_instructor.dart';
import 'package:lms_user_app/feature/courseDetails/widgets/course_overview.dart';
import 'package:lms_user_app/feature/courseDetails/widgets/course_resource.dart';
import 'package:lms_user_app/feature/courseDetails/widgets/course_review.dart';
import 'package:lms_user_app/feature/courseDetails/widgets/frequently_ask_question.dart';
import 'package:lms_user_app/feature/common/organization.dart';
import 'package:lms_user_app/feature/courseDetails/widgets/related_course.dart';
import 'package:lms_user_app/utils/dimensions.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  bool isSelect = false;

  @override
  void initState() {
    super.initState();
    Get.find<CourseDetailController>().getCourseDetail(id: Get.arguments);
    Get.find<ReviewController>().getAllReviews(id: Get.arguments);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<MyVideoPlayerController>().videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'course_details'.tr,
        bgColor: Theme.of(context).primaryColor,
        // actions: [
        //   IconButton(
        //     onPressed: () => Get.find<WishListController>()
        //         .addToWishList(Get.arguments, 'course'),
        //     icon: SvgPicture.asset(Images.heart,
        //         color: Theme.of(context).primaryColorLight),
        //     splashRadius: 23,
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: SvgPicture.asset(Images.share,
        //         color: Theme.of(context).primaryColorLight),
        //     splashRadius: 23,
        //   ),
        // ],
      ),
      body: SafeArea(
        child: GetBuilder<CourseDetailController>(builder: (controller) {
          return controller.isLoading
              ? const LoadingIndicator()
              : mainUI(context, controller);
        }),
      ),
      // bottomNavigationBar:
      //     GetBuilder<CourseDetailController>(builder: (controller) {
      //   return controller.isLoading
      //       ? const SizedBox()
      //       : ButtonSection(data: controller.courseDetail.data);
      // }),
    );
  }

  Widget mainUI(BuildContext context, CourseDetailController controller) {
    return ListView(
      children: [Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //--------------------------------------------------video player
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              color: Colors.orange.withOpacity(0.2),
              height: MediaQuery.of(context).size.height*0.3,
              child: CourseVideoPlayer(data: controller.courseDetail.data,),
            ),
            const Gap(Dimensions.paddingSizeDefault),

            //--------------------------------------------------------- CourseOverView
            CourseOverView(data: controller.courseDetail.data),
            const Gap(30),

            //--------------------------------------------------------- CourseFeatures
            if (controller.courseDetail.data.features != null)
              CourseFeatures(feature: controller.courseDetail.data.features!),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //-------------------------------------------------------- CourseInstructor
            CourseInstructor(
                title: 'course_instructor',
                instructors: controller.courseDetail.data.instructors!),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //-------------------------------------------------------- CourseCurriculum
            CourseCurriculum(sections: controller.courseDetail.data.sections!),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //-------------------------------------------------------- CourseResource
            CourseResource(resource: controller.courseDetail.data.resources!),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //------------------------------------------------------- CourseReview
            CourseReview(
              totalReview: controller.courseDetail.data.totalReviews ?? 0,
              avgRatings: controller.courseDetail.data.avgRatings ?? "0.0",
              isReviewed: controller.courseDetail.data.isReviewed ?? false,
              isCanReview: controller.courseDetail.data.canReview ?? false,
              reviewList: controller.reviewController.reviewList,
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //-------------------------------------------------------- RelatedCourse
            RelatedCourse(courses: controller.courseDetail.data.relatedCourses!),
            const SizedBox(
              height: 30,
            ),

            //------------------------------------------------------- FrequentlyAskQuestion
            FrequentlyAskQuestion(faqList: controller.courseDetail.data.faqs!),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            //------------------------------------------------------- OrganizationWidget
            if (controller.courseDetail.data.organization != null)
              OrganizationWidget(organization: controller.courseDetail.data.organization!),
            const SizedBox(height: Dimensions.paddingSizeDefault),
          ]
      )
      ],
    );
  }
}
