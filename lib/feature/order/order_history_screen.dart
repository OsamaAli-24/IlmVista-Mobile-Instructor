import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/core/helper/route_helper.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'order_history'.tr,
        bgColor: Theme.of(context).cardColor,
        titleColor: Theme.of(context).textTheme.bodyLarge!.color!,

      ),
      body: ListView.builder(
        shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 7.5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).primaryColorLight,
                      width: 1,
                    ),
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(index==0)
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Basic English Grammar Skill full Course",
                          style: poppinsMedium.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: Dimensions.fontSizeSmall
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(RouteHelper.invoiceScreen);
                          },
                          borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.radiusSmall,vertical: 3),
                            child: Row(
                              children: [
                                SvgPicture.asset(Images.download),
                                const SizedBox(width: 8),
                                Text('invoice'.tr,
                                    style: poppinsMedium.copyWith(
                                        color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                                        fontSize: Dimensions.fontSizeSmall
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    Text("Payment by bKash",style: poppinsRegular.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                        fontSize: Dimensions.fontSizeSmall),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$ 180.50",
                        style: poppinsSemiBold.copyWith(
                    color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                fontSize: Dimensions.fontSizeSmall)
                        ),
                        Text("01 Feb 2023 12:44pm"
                          ,style: poppinsRegular.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                            fontSize: Dimensions.fontSizeExtraSmall)),
                      ],
                    ),
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
