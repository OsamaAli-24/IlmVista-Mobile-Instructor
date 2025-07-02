import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/controller/student_controller.dart';
import 'package:lms_user_app/feature/profile/student_profile/widgets/student_courses.dart';
import 'package:lms_user_app/feature/profile/student_profile/widgets/student_followings.dart';
import 'package:lms_user_app/feature/profile/student_profile/widgets/student_header_section.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';
import '../../../utils/dimensions.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  TabController? _tabController;
  late StudentController studentController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });

    studentController = Get.find();
    studentController.state.getStudentProfile(Get.arguments ?? 0);
    studentController.state.getStudentCoursesList(Get.arguments ?? 0);
    studentController.state.getStudentFollowingList(Get.arguments ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainUI(context),
    );
  }

  DefaultTabController mainUI(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
          controller: _scrollController,
          floatHeaderSlivers: false,
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 260,
                elevation: 0.0,
                pinned: true,
                backgroundColor: Theme.of(context).primaryColor,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Get.isDarkMode
                        ? Colors.white
                        : Theme.of(context).cardColor,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                title: SABT(
                  child: Text(
                    'Name',
                    textAlign: TextAlign.start,
                    style: poppinsSemiBold.copyWith(
                        color: Get.isDarkMode
                            ? Theme.of(context).textTheme.bodyLarge?.color
                            : Theme.of(context).cardColor,
                        fontSize: Dimensions.fontSizeDefault),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1,
                  background: Container(
                    color: Theme.of(context).cardColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => !studentController.state.isProfileNotLoaded
                            ? StudentHeaderSection(
                                studentProfile:
                                    studentController.state.studentProfile,
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ))
                      ],
                    ),
                  ),
                  collapseMode: CollapseMode.parallax,
                ),
              ),
              // SliverPersistentHeader(
              //   delegate: Delegate(
              //     height: 40,
              //     widget: Container(
              //       width: 80,
              //       height: 30,
              //       decoration: BoxDecoration(
              //           border:
              //               Border.all(color: Theme.of(context).primaryColor),
              //           borderRadius:
              //               const BorderRadius.all(Radius.circular(8))),
              //       child: Row(
              //         mainAxisSize: MainAxisSize.min,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           SvgPicture.asset(
              //             Images.chat,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //           Text('Chat'),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: Delegate(
                    height: 40,
                    widget: Container(
                      color: Theme.of(context).cardColor,
                      child: TabBar(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSizeDefault),
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
                            : Theme.of(context).textTheme.bodyLarge!.color!,
                        unselectedLabelStyle: poppinsMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSizeSmall),
                        labelStyle: poppinsBold.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge!.color!,
                          fontSize: Dimensions.fontSizeSmall,
                        ),
                        tabs: [
                          Tab(text: 'course'.toUpperCase().tr),
                          Tab(text: 'instructor'.toUpperCase().tr),
                        ],
                      ),
                    )),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              Obx(() => !studentController.state.isStudentCoursesNotLoaded
                  ? StudentCourses(courses: studentController.state.studentCourses,)
                  : const Center(
                      child: CircularProgressIndicator(),
                    )),

              Obx(() => !studentController.state.isStudentCoursesNotLoaded
                  ? FollowingInstructor(following: studentController.state.studentFollowing,)
                  : const Center(
                child: CircularProgressIndicator(),
              )),

            ],
          )),
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

class SABT extends StatefulWidget {
  final Widget child;
  const SABT({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  SABTState createState() {
    return SABTState();
  }
}

class SABTState extends State<SABT> {
  ScrollPosition? _position;
  bool? _visible;
  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context).position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible!,
      child: widget.child,
    );
  }
}
