import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'coupon'.tr,
        bgColor: Theme.of(context).cardColor,
        titleColor: Theme.of(context).textTheme.bodyLarge!.color!,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(Images.demoCouponBanner,fit: BoxFit.fitWidth,),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
                itemBuilder: (context,index){
              return  Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.paddingSizeDefault,
                  right: Dimensions.paddingSizeDefault,
                  bottom: Dimensions.paddingSizeExtraSmall,
                  top: index!=0 ? Dimensions.paddingSizeExtraSmall : Dimensions.paddingSizeDefault,

                ),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColorLight,
                        width: 1),
                    color:  Colors.white,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Dimensions.radiusSmall)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            child: Image.asset(Images.logo,height: 60,width: 60,),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hellio Jamsh",
                                style: poppinsMedium.copyWith(
                                    color: Theme.of(context).textTheme.bodyLarge!.color!,
                                    fontSize: Dimensions.fontSizeDefault),
                              ),
                              const SizedBox(height: Dimensions.paddingSizeRadius,),
                              Text("English grammar course",
                                style: poppinsMedium.copyWith(
                                    color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                                    fontSize: Dimensions.fontSizeExtraSmall),
                              ),
                              const SizedBox(height: Dimensions.paddingSizeRadius,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Ended: 26 Jun 2023",
                                      style: poppinsRegular.copyWith(
                                          color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                                          fontSize: Dimensions.fontSizeExtraSmall)
                                  ),
                                  Text('copy'.tr,
                                      style: poppinsSemiBold.copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: Dimensions.fontSizeExtraSmall)
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
