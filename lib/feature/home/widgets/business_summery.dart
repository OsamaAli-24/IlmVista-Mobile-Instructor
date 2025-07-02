import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/data/model/home_data_model/home_data_model.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import '../../../utils/styles.dart';

class BusinessSummery extends StatelessWidget {
  final HomeDataModel? homeDataModel;

  const BusinessSummery({Key? key, this.homeDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'business_summery'.tr,
            style:
            poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeDefault),
          ),
          const SizedBox(height: Dimensions.paddingSizeDefault),
          Row(
            children: [
              Expanded(
                child: summeryCard(context,'total_earning'.tr,Images.earning, homeDataModel?.data?.totalEarning ?? "\$0")
              ),
              const SizedBox(width: Dimensions.paddingSizeDefault),
              Expanded(
                child: summeryCard(context,'total_course'.tr,Images.course, homeDataModel?.data?.totalCourse.toString() ?? "0")
              ),
            ],
          ) ,
          const SizedBox(height: Dimensions.paddingSizeDefault),
          Row(
            children: [
              Expanded(
                child: summeryCard(context,'total_student'.tr,Images.student, homeDataModel?.data?.totalStudent.toString() ??"0")
              ),
              const SizedBox(width: Dimensions.paddingSizeDefault),
              Expanded(
                child: summeryCard(context,'t_enrollment'.tr,Images.enrollment, homeDataModel?.data?.totalEnrollment.toString() ?? "0")
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget summeryCard(context,String title,String icon, String value){
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context)
                .textTheme
                .bodyLarge!
                .color!
                .withOpacity(0.06)),
        borderRadius: const BorderRadius.all(Radius.circular(6),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(title,style: poppinsRegular.copyWith(
                      color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6)
                  ),),
                  SvgPicture.asset(icon)
                ],
              ),
            ),
            Text(value,style: poppinsSemiBold.copyWith(
                color: Theme.of(context).colorScheme.primary
            ),),
          ],
        ),
      ),
    );
  }
}
