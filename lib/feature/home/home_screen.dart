import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/controller/auth_controller.dart';
import 'package:lms_user_app/controller/barchart_controller.dart';
import 'package:lms_user_app/controller/home_controller.dart';
import 'package:lms_user_app/data/model/home_data_model/home_data.dart';
import 'package:lms_user_app/feature/common/course_instructor.dart';
import 'package:lms_user_app/feature/home/widgets/bar_chart_sample.dart';
import 'package:lms_user_app/feature/home/widgets/business_summery.dart';
import 'package:lms_user_app/feature/home/widgets/home_app_bar.dart';
import 'package:lms_user_app/feature/home/widgets/my_course_widget.dart';
import 'package:lms_user_app/feature/home/widgets/recent_enrollment.dart';
import 'package:lms_user_app/feature/home/widgets/top_courses_widget.dart';
import 'package:lms_user_app/feature/home/widgets/top_instructor.dart';
import 'package:lms_user_app/repository/auth_repo.dart';
import 'package:lms_user_app/utils/dev_util.dart';
import '../common/explore_by_category.dart';
import '../common/featured_courses_widget.dart';
import '../common/offer_courses.dart';
import 'widgets/banner_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final AuthController authController = Get.find();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        Get.find<HomeController>().paginate();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        backButton: false,
        profileImage: authController.instructorProfileImage ?? '',
      ),
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return
                // controller.isLoading == true ? const LoadingIndicator() :
                mainUI(controller, context);
          },
        ),
      ),
    );
  }

  Widget mainUI(HomeController controller, BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await controller.getHomeData(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    //--------------------------------------BusinessSummery
                    BusinessSummery(
                      homeDataModel: controller.homeModel,
                    ),
                    //------------------------------------------------- bar chart
                    BarChartSample(
                      data: controller.homeModel?.data?.enrollStats,
                    ),
                    const SizedBox(height: 15),

                    //-----------------------------------------------------RecentEnrollment
                    RecentEnrollment(title: 'recent_enrollment'.tr, latestEnrolls: controller.homeModel?.data?.latestEnrolls,),
                    const SizedBox(height: 30),

                    //------------------------------------------------------------TopInstructor
                    // TopInstructor(title: 'top_instructor'.tr),
                    // const SizedBox(height: 15),
                  ],
                ),
        ),
      ),
    );
  }

  Widget itemBuilderByCategory(
      BuildContext context, int index, List<HomeData> data) {
    switch (data[index].sectionType) {
      case "sliders":
        // return BannerView(bannerIndex: index);
        return const Text('Visible BannerView Here');
      case 'my_courses':
        return MyCourseWidget(myCourseList: data[index].myCourses);
      case 'categories':
        return ExploreByCategoryWidget(
          title: 'categories',
          categoryList: data[index].categories!,
        );
      case 'top_courses':
        return TopCourseWidget(list: data[index].topCourses!);
      case 'instructors':
        return CourseInstructor(
            title: 'instructor', instructors: data[index].instructors!);
      case 'offer_courses':
        return OfferCourses(offeredCourses: data[index].offerCourses!);
      case 'featured_courses':
        return FeaturedCourse(courseList: data[index].featuredCourses!);
      default:
        return const SizedBox();
    }
  }
}
