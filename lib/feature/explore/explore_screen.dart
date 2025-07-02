import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/components/loading_indicator.dart';
import 'package:lms_user_app/controller/explore_controller.dart';
import 'package:lms_user_app/feature/common/explore_by_category.dart';
import 'package:lms_user_app/feature/common/featured_courses_widget.dart';
import 'package:lms_user_app/feature/common/offer_courses.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import '../common/course_instructor.dart';
import 'widgets/book_by_category.dart';
import 'widgets/free_course.dart';
import 'widgets/suggested_courses.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButtonExist: false,
        title: 'explore_course'.tr,
        bgColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: GetBuilder<ExploreController>(builder: (controller) {
          return controller.isLoading
              ? const LoadingIndicator()
              : mainUI(context, controller);
        }),
      ),
    );
  }

  Widget mainUI(BuildContext context, ExploreController controller) {
    return RefreshIndicator(
      onRefresh: () => controller.getExploreData(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: CustomScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                      SuggestedCourses(
                        explore: controller.explore,
                      ),
                      const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                      ExploreByCategoryWidget(
                        title: 'explore_by_category',
                        categoryList:
                            controller.explore.data!.courseCategories!,
                      ),
                      const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                      FeaturedCourse(
                        courseList: controller.explore.data!.featuredCourses!,
                      ),
                      const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                      FreeCourses(
                        explore: controller.explore,
                      ),
                      const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                      // ExploreCourseInstructorWidget(
                      //     explore: controller.explore,
                      //     title: 'explore_by_instructor'),
                      CourseInstructor(
                          title: 'explore_by_instructor',
                          instructors: controller.explore.data!.instructors!),
                      SizedBox(
                          height: controller
                                  .explore.data!.offeredCourses!.isNotEmpty
                              ? Dimensions.paddingSizeExtraLarge
                              : 0),
                      controller.explore.data!.offeredCourses!.isNotEmpty
                          ? OfferCourses(
                              offeredCourses:
                                  controller.explore.data!.offeredCourses!)
                          : const SizedBox(),
                      const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                      if (controller.explore.data!.books != null)
                        BookByCategoryWidget(
                          explore: controller.explore,
                        ),
                      const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
