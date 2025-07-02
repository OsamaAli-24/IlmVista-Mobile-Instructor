import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class CertificateDialog extends StatelessWidget {
  const CertificateDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog( // <-- SEE HERE
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6),
        ),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Image.asset(Images.demoCertificate,fit: BoxFit.contain,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: Text("English Spoken Certificate",
            style: poppinsMedium.copyWith(
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontSize: Dimensions.fontSizeDefault
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: Text("English course have completed by 100% then download English Certificate.",
            style: poppinsRegular.copyWith(
              color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.5),
              fontSize: Dimensions.fontSizeSmall,
            ),
          ),
        ),
        const SizedBox(height: Dimensions.paddingSizeExtraLarge),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(Dimensions.radiusSmall)
                  ),
                  child: Text('download'.tr,
                      style: poppinsRegular.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: Dimensions.fontSizeSmall
                      )
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: Dimensions.cartWidgetSize),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(Images.facebook,height: 15,),
                        SvgPicture.asset(Images.twitter,height: 15),
                        SvgPicture.asset(Images.linkedin,height: 15),
                        SvgPicture.asset(Images.instagram,height: 15),
                        SvgPicture.asset(Images.messenger,height: 15),
                      ],
                    ),
                  )),
            ],
          ),
        ),

      ],
    );
  }
}
