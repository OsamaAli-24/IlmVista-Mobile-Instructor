import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/loading_indicator.dart';
import 'package:lms_user_app/controller/organization_controller.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/feature/bookStore/widget/organization_header_section.dart';
import 'package:lms_user_app/feature/bookStore/widget/organizer_info.dart';
import 'package:lms_user_app/feature/organization/widget/course_info.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class OrganizationScreen extends StatefulWidget {
  const OrganizationScreen({Key? key}) : super(key: key);

  @override
  State<OrganizationScreen> createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OrganizationController>(
        builder: (controller) {
          return controller.isLoading
              ? const LoadingIndicator()
              : mainUI(context, controller);
        },
      ),
    );
  }

  Widget mainUI(BuildContext context, OrganizationController controller) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 200,
            elevation: 0.0,
            pinned: true,
            backgroundColor: Theme.of(context).primaryColor,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).cardColor,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed(RouteHelper.editOrganizationScreen);
                },
                splashRadius: 25,
                icon: SvgPicture.asset(Images.editProfile),
              )
            ],
            title: Text(
              "Sikho Digital Learning",
              textAlign: TextAlign.start,
              style: poppinsSemiBold.copyWith(
                color: Theme.of(context).cardColor,
                fontSize: Dimensions.fontSizeDefault,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Theme.of(context).cardColor,
                child: OrganizationHeaderSection(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Theme.of(context).cardColor,
              child: OrganizerInfo(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Theme.of(context).cardColor,
              child: CourseInformation(),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarDelegate(
              tabBar: TabBar(
                controller: _tabController,
                indicatorWeight: 1,
                indicatorColor: Theme.of(context).primaryColor,
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Theme.of(context).textTheme.bodyLarge!.color!,
                tabs: [
                  Tab(text: 'course'.toUpperCase().tr),
                  Tab(text: 'instructor'.toUpperCase().tr),
                ],
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(), // Replace this with your CourseTab widget
          Container(), // Replace this with your InstructorTab widget
        ],
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate({required this.tabBar});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).cardColor,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) {
    return false;
  }
}
