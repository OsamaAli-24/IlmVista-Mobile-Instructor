import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/loading_indicator.dart';
import 'package:lms_user_app/controller/my_course_controller.dart';
import 'package:lms_user_app/feature/common/my_course_widget_item.dart';
import 'package:lms_user_app/utils/dimensions.dart';

class PurchaseCourseList extends StatefulWidget {
  const PurchaseCourseList({Key? key}) : super(key: key);

  @override
  State<PurchaseCourseList> createState() => _PurchaseCourseListState();
}

class _PurchaseCourseListState extends State<PurchaseCourseList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        Get.find<MyCourseController>().paginatePurchaseCourse();
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
    return GetBuilder<MyCourseController>(
        initState: (state) => Get.find<MyCourseController>().getMyCourseList(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeSmall),
            child: controller.isMyCourseLoading
                ? const LoadingIndicator()
                : mainUI(controller),
          );
        });
  }

  Widget mainUI(MyCourseController controller) {
    return RefreshIndicator(
      onRefresh: () => controller.getMyCourseList(),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.myCourseList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return MyCourseWidgetItem(
                        course: controller.myCourseList[index]);
                  },
                ),
                const SizedBox(height: Dimensions.paddingSizeDefault),
                if (controller.isMyCourseLoadingMore == true)
                  const SliverToBoxAdapter(
                    child: LoadingIndicator(),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
