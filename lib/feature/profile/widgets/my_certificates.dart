import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/feature/profile/widgets/certificate_dialog.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class MyCertificatesWidget extends StatelessWidget {
  const MyCertificatesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('my_certificates'.tr,style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeDefault),),
          const SizedBox(height: Dimensions.paddingSizeDefault,),
          SizedBox(
            height: 112,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                    child: InkWell(
                      onTap: (){
                        Get.dialog(const CertificateDialog());
                      },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(Dimensions.radiusSmall),
                        ),
                        child: Image.asset(Images.demoCertificate,),
                      ),
                    ),
                  );
                },
            ),
          )
        ],
      ),
    );
  }

}
