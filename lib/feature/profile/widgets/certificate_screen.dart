import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/feature/profile/widgets/certificate_dialog.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'certificates'.tr,
        bgColor: Theme.of(context).cardColor,
        titleColor: Theme.of(context).textTheme.bodyLarge!.color,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15
            ),
            itemCount: 20,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: (){
                  if(index==0){
                    Get.dialog(const CertificateDialog());
                  }
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(Dimensions.radiusSmall),
                      ),
                      child: Image.asset(
                        Images.demoCertificate,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if(index != 0)
                    Positioned(
                      top: 0.0,
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.3),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(Dimensions.radiusSmall),
                          ),
                        ),
                      ),
                    ),
                    if(index != 0)
                      SvgPicture.asset(Images.lock,color: Colors.white,width: 15,height: 18),
                  ],
                ),
              );
            },
        ),
      ),
    );
  }
}
