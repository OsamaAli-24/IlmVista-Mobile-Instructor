import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/controller/auth_controller.dart';
import 'package:lms_user_app/controller/instructor_controller.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/feature/profile/instructor_profile/widgets/pending_course_tab.dart';
import 'package:lms_user_app/feature/profile/instructor_profile/widgets/student_tab.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

import '../../../utils/dimensions.dart';
import 'widgets/all_courses_tab.dart';

class InstructorProfileScreen extends StatefulWidget {
  const InstructorProfileScreen({super.key});

  @override
  State<InstructorProfileScreen> createState() =>
      _InstructorProfileScreenState();
}

class _InstructorProfileScreenState extends State<InstructorProfileScreen>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  bool _isAppBarExpanded = true;
  TabController? _tabController;

  final AuthController authController = Get.find();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset >=
            (_scrollController.position.maxScrollExtent - kToolbarHeight)) {
          setState(() {
            _isAppBarExpanded = false;
          });
        } else {
          setState(() {
            _isAppBarExpanded = true;
          });
        }
      });

    Get.find<InstructorController>().getInstructorProfile(1);
    Get.find<InstructorController>().getInstructorCourseList(1);
    Get.find<InstructorController>().getInstructorsStudentList(1);
    Get.find<InstructorController>().getInstructorPendingCourseList(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(bgColor: Theme.of(context).cardColor),
      body: GetBuilder<InstructorController>(builder: (controller) {
        return controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : DefaultTabController(
                length: 3,
                child: NestedScrollView(
                    controller: _scrollController,
                    floatHeaderSlivers: true,
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        appBarWidget(context, controller),

                        SliverPersistentHeader(
                            pinned: true,
                            floating: false,
                            delegate: Delegate(
                                height: 40,
                                widget: Container(
                                  color: Theme.of(context).cardColor,
                                  child: TabBar(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal:
                                              Dimensions.paddingSizeDefault),
                                      indicatorWeight: 1,
                                      controller: _tabController,
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      indicatorColor: Get.isDarkMode
                                          ? Colors.green
                                          : Theme.of(context).primaryColor,
                                      labelColor: Get.isDarkMode
                                          ? Colors.green
                                          : Theme.of(context).primaryColor,
                                      unselectedLabelColor: Get.isDarkMode
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color!
                                              .withOpacity(0.6)
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color!,
                                      unselectedLabelStyle:
                                          poppinsMedium.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize:
                                                  Dimensions.fontSizeSmall),
                                      labelStyle: poppinsBold.copyWith(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color!,
                                        fontSize: Dimensions.fontSizeSmall,
                                      ),
                                      tabs: [
                                        Tab(text: 'all_courses'.tr),
                                        Tab(text: 'pending_courses'.tr),
                                        Tab(text: 'student'.tr),
                                      ]),
                                )))
                      ];
                    },
                    body: Padding(
                      padding: EdgeInsets.only(top:_scrollController.initialScrollOffset),
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          //---------------------------------------------------------------- AllCoursesTab
                          AllCoursesTab(
                            service: controller.instructorCourseList,
                          ),

                          //---------------------------------------------------------------- PendingCourseTab
                          PendingCourseTab(
                            service: controller.instructorPendingCourseList,
                          ),

                          //---------------------------------------------------------------- StudentTab
                          StudentTab(
                            studentList: controller.instructorStudentList,
                          ),
                        ],
                      ),
                    )),
              );
      }),
    );
  }

  SliverAppBar appBarWidget(
      BuildContext context, InstructorController controller) {
    final Size size = MediaQuery.of(context).size;

    return SliverAppBar(
      expandedHeight: size.height*0.4,
      elevation: 0,
      pinned: true,
      automaticallyImplyLeading: true,
      forceMaterialTransparency: false,
      iconTheme: IconThemeData(
          color: !Get.isDarkMode
              ? Colors.black
              : Colors.white), //backgroundColor: Theme.of(context).cardColor,
      // leading: IconButton(
      //   onPressed: () => Get.back(),
      //   icon: Icon(
      //     Icons.arrow_back,
      //     color: innerBoxIsScrolled ? Colors.blue : Colors.black,
      //   ),
      // ),
      title: Text(
        "${controller.instructorProfile.data?.firstName ?? "Alexa"} ${controller.instructorProfile.data?.lastName ?? "Deo"}",
        textAlign: TextAlign.start,
        style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeDefault),
      ),
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        background: PreferredSize(
          preferredSize: const Size.fromHeight(226),
          child: profileInfoWidget(controller),
        ),
        collapseMode: CollapseMode.parallax,
      ),

      actions: [
        PopupMenuButton(
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Text("Edit"),
                    onTap: () {
                      Get.toNamed(RouteHelper.editProfileScreen, arguments: controller.instructorProfile.data);
                    },
                  )
                ])
      ],
    );
  }

  Widget profileInfoWidget(InstructorController controller) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      color: Theme.of(context).cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: Dimensions.paddingSizeLarge),
          //--------------------------------------------------------profile image
          ClipRRect(
              borderRadius: const BorderRadius.all(
                  Radius.circular(Dimensions.radiusExtraMoreLarge)),
              child: Image.network(
                controller.instructorProfile.data?.profilePic ?? '',
                height: 70,
                width: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  Images.placeholderSquare,
                  height: 70,
                  width: 70,
                ),
              )),
          const SizedBox(height: Dimensions.paddingSizeSmall),
          //---------------------------------------------------instructor name
          Text("${controller.instructorProfile.data?.firstName ?? "Alexa"} ${controller.instructorProfile.data?.lastName ?? "Deo"}",
              style: poppinsSemiBold.copyWith(
                  fontSize: Dimensions.fontSizeDefault)),
          //const SizedBox(height: Dimensions.paddingSizeExtraSmall),
          //--------------------------------------------------instructor designation
          Text(
            controller.instructorProfile.data?.designation ?? "Web Developer",
            style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
          ),
          const SizedBox(height: Dimensions.paddingSizeRadius),
          //---------------------------------------------------organization name
          Text(
            controller.instructorProfile.data?.organizationName ??
                "SpaGreen Creative",
            textAlign: TextAlign.center,
            style: poppinsSemiBold.copyWith(
                color: Get.isDarkMode? Colors.green : Theme.of(context).primaryColor,
                fontSize: Dimensions.fontSizeSmall),
          ),
          const SizedBox(height: Dimensions.paddingSizeSmall),
          socialMediaIcons(),
          const SizedBox(height: Dimensions.paddingSizeSmall),
          SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                //------------------------------------------------total curses
                Expanded(
                    child: infoItem(
                        controller.instructorProfile.data?.totalCourse
                                .toString() ??
                            '12',
                        'course'.tr)),
                //------------------------------------------------total students
                Expanded(
                    child: infoItem(
                        controller.instructorProfile.data?.totalStudent
                                .toString() ??
                            '12',
                        'student'.tr)),
                //------------------------------------------------total followers
                Expanded(
                    child: infoItem(
                        controller.instructorProfile.data?.followers
                                .toString() ??
                            '12',
                        'follower'.tr)),
                //------------------------------------------------total following
                Expanded(
                    child: infoItem(
                        controller.instructorProfile.data?.followings
                                .toString() ??
                            '12',
                        'following'.tr)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container infoItem(String value, String label) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
      width: 75,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
          color: Theme.of(context).primaryColor.withOpacity(0.09)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: poppinsSemiBold.copyWith(
                color: Get.isDarkMode? Colors.green.withOpacity(0.5) : Theme.of(context).primaryColor,
                fontSize: Dimensions.fontSizeDefault),
          ),
          Text(
            label,
            style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
          ),
        ],
      ),
    );
  }

  Row socialMediaIcons() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //facebook
          //---------------------------------------------------social media
          iconItem(Images.facebook), iconItem(Images.twitter),
          iconItem(Images.linkedin), iconItem(Images.instagram),
        ],
      );

  Padding iconItem(String iconFile) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(
        iconFile,
        color: Get.isDarkMode? Colors.white70 : Theme.of(context).primaryColor,
      ),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget widget;

  Delegate({required this.height, required this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
