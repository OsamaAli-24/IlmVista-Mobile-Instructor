import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/controller/enrollment_controller.dart';
import 'package:lms_user_app/feature/home/widgets/enrollment_card.dart';
import 'package:lms_user_app/utils/dimensions.dart';

import '../../utils/styles.dart';

class EnrollmentScreen extends StatefulWidget {
  const EnrollmentScreen({Key? key}) : super(key: key);

  @override
  State<EnrollmentScreen> createState() => _EnrollmentScreenState();
}

class _EnrollmentScreenState extends State<EnrollmentScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Get.find<EnrollmentController>().getEnrollmentsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isFromDashboard = Get.arguments ?? false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: isFromDashboard,
        iconTheme:
            isFromDashboard ? const IconThemeData(color: Colors.white) : null,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'enrollment'.tr,
              style: poppinsMedium.copyWith(
                  fontSize: Dimensions.fontSizeLarge,
                  color: Theme.of(context).primaryColorLight),
            ),

            // Your widgets here
          ],
        ),
      ),
      body: GetBuilder<EnrollmentController>(
        builder: (controller) {
          return SizedBox(
              child: controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.enrollmentData != null && controller.enrollmentData!.isNotEmpty? ListView.builder(
                      itemCount: controller.enrollmentData?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: index == 0 ? Dimensions.paddingSizeDefault : 0,
                            bottom: Dimensions.paddingSizeDefault,
                            left: Dimensions.paddingSizeDefault,
                            right: Dimensions.paddingSizeDefault,
                          ),
                          child: EnrollmentCard(
                            width: MediaQuery.of(context).size.width,
                            latestEnrolls: controller.enrollmentData?[index],
                          ),
                        );
                      }): const Center(child: Text("Empty Enrollment"),)
          );
        },
      ),
    );
  }
}
