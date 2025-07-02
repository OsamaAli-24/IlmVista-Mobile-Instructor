import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/components/rating_view.dart';
import 'package:lms_user_app/controller/review_controller.dart';
import 'package:lms_user_app/feature/review/widgets/review_item.dart';

class ManageReviewScreen extends GetView<ReviewController> {
  const ManageReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'All Review'.tr,
        bgColor: Theme
            .of(context)
            .cardColor,
        centerTitle: false,
        titleColor: Theme
            .of(context)
            .textTheme
            .bodyLarge!
            .color,
      ),
      body: Column(
        children: [
          const RatingView(),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return const ReviewItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
