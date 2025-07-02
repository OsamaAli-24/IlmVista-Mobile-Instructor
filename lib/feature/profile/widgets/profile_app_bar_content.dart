import 'package:flutter/material.dart';
import 'package:lms_user_app/components/custom_image.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

class ProfileAppBarContent extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBarContent({super.key,});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children:  [
            const SizedBox(height: Dimensions.paddingSizeLarge,),
            const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radiusExtraMoreLarge)),
                child: CustomImage(image: '',height: 70,width: 70,)),
            const SizedBox(height: Dimensions.paddingSizeSmall,),
            Text("Alexa Deo",
              style: poppinsSemiBold.copyWith(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: Dimensions.fontSizeDefault),),
            const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
            Text("01932516844",
              style: poppinsRegular.copyWith(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: Dimensions.fontSizeSmall),),
            const SizedBox(height: Dimensions.paddingSizeRadius),
            SizedBox(
              width: width/1.4,
              child: Text("Lake City, Concord Shopping Complex, Khilkhet, Dhka-1229",
                textAlign: TextAlign.center,
                style: poppinsRegular.copyWith(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: Dimensions.fontSizeSmall),),
            ),
            const SizedBox(height: Dimensions.paddingSizeSmall,),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(226);
}