import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/feature/myCourse/widgets/purchase_course_list.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';
import 'widgets/wishlist_course.dart';

class MyCourseScreen extends StatefulWidget {
  const MyCourseScreen({Key? key}) : super(key: key);

  @override
  State<MyCourseScreen> createState() => _MyCourseScreenState();
}

class _MyCourseScreenState extends State<MyCourseScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    //Get.find<MyCourseController>().getMyCourseList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBackButtonExist: false,
        title: 'my_course'.tr,
        bgColor: Theme.of(context).primaryColor,
      ),
      body: Column(children: [
        const SizedBox(
          height: Dimensions.paddingSizeLarge,
        ),
        Padding(
          padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
                borderRadius: const BorderRadius.all(
                    Radius.circular(Dimensions.radiusSmall))),
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
              child: TabBar(
                isScrollable: true,
                controller: _tabController,
                indicatorColor: Theme.of(context).colorScheme.primary,
                indicator: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Dimensions.radiusSmall)),
                    color: Theme.of(context).colorScheme.primary),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Theme.of(context).cardColor,
                unselectedLabelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelStyle: poppinsRegular.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Dimensions.fontSizeSmall,
                ),
                labelStyle: poppinsBold.copyWith(
                  color: Theme.of(context).cardColor,
                  fontSize: Dimensions.fontSizeSmall,
                ),
                tabs: [
                  Tab(text: 'purchase_course'.tr),
                  Tab(text: 'wishlist'.tr),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: Dimensions.paddingSizeDefault,
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: const [
            PurchaseCourseList(),
            WishListCourse(),
          ],
        )),
      ]),
    );
  }
}
