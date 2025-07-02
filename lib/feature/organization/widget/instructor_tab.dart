import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/controller/organization_controller.dart';
import 'package:lms_user_app/data/model/common/instructor.dart';

import '../../../components/custom_image.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';

class InstructorTab extends StatelessWidget {
  final int organizationId;
  const InstructorTab({super.key, required this.organizationId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrganizationController>(builder: (controller) {
      return NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            controller.getInstructorList(organizationId);
          }
          return false;
        },
        child: ListView.builder(
          controller: controller.instructorScrollController,
          itemCount: controller.instructorList.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (index == controller.instructorList.length - 1 &&
                controller.isInstructorListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return instructorItem(controller.instructorList[index], context);
            }
          },
        ),
      );
    });
  }

  Widget instructorItem(Instructor instructor, BuildContext context) {
    return SizedBox(
      height: 76,
      child: Stack(
        children: [
          Positioned(
            left: 15,
            top: 13,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(Dimensions.radiusExtraMoreLarge),
              ),
              child: CustomImage(
                image: instructor.image ?? '',
                placeholder: Images.placeholderSquare,
                height: 50,
                width: 50,
              ),
            ),
          ),
          Positioned(
              left: 75,
              top: 12,
              child: Text(instructor.name ?? '',
                  style: poppinsMedium.copyWith(
                      fontSize: Dimensions.fontSizeDefault))),
          Positioned(
            left: 75,
            top: 30,
            child: Text(
              instructor.instructor ?? '',
              style: poppinsMedium.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Dimensions.fontSizeExtraSmall),
            ),
          ),
          Positioned(
            left: 75,
            top: 50,
            child: Text(instructor.instructor ?? '',
                style: poppinsRegular.copyWith(
                    //color: Theme.of(context).colorScheme.primary,
                    fontSize: Dimensions.fontSizeSmall)),
          ),
          const Positioned(
            top: 75,
            left: 15,
            right: 15,
            child: Divider(height: 1),
          )
        ],
      ),
    );
  }
}
