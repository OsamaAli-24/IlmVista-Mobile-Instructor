import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_image.dart';
import 'package:lms_user_app/core/helper/date_converter.dart';
import 'package:lms_user_app/feature/conversation/model/conversation_user.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

class ChannelItem extends StatelessWidget {
  final String channelupdatedAt;
  final ConversationUserModel conversationUserModel;
  final int isRead;
  final String bookingID;
  const ChannelItem({Key? key, required this.conversationUserModel, required this.channelupdatedAt, required this.isRead,required this.bookingID}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String imagePath = conversationUserModel.user!.userType=="customer"?"/user/profile_image/"
        :conversationUserModel.user!.userType=="provider-admin"?"/provider/logo/"
        :conversationUserModel.user!.userType=="super-admin"?"/user/profile_image/"
        :conversationUserModel.user!.userType=="provider-serviceman"?"/serviceman/profile/":"";
    String name = '';
    String image = '';
    String userTypeImage = '';

    /*if(conversationUserModel.user!.provider != null){
      name =  conversationUserModel.user!.provider!.companyName!;
      print(conversationUserModel.user!.provider!.companyName!);
      image = "";
      userTypeImage =  'provider'.tr;
    }else{
      name = "${conversationUserModel.user!.firstName!} ${conversationUserModel.user!.lastName!}";
      image = "";
      userTypeImage = conversationUserModel.user!.userType! == 'provider-serviceman'?"provider-serviceman".tr:"super-admin".tr;
    }*/


    return InkWell(
      onTap:(){
       /* Get.find<ConversationController>().setChannelId(conversationUserModel.channelId!);
        Get.find<ConversationController>().setUserImageType(userTypeImage);
        Get.toNamed(RouteHelper.getChatScreenRoute(conversationUserModel.channelId!,name,image,channelupdatedAt,bookingID));
*/



      },
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: Dimensions.paddingSizeExtraSmall,
            horizontal: Dimensions.paddingSizeSmall,
        ),
        padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
          color: isRead == 0? Theme.of(context).colorScheme.primary.withOpacity(.5) : Theme.of(context).hoverColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const SizedBox(width: Dimensions.paddingSizeSmall,),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CustomImage(
                  height: 50,
                  width: 50,
                  image: image
              ),
            ),
            const SizedBox(height:Dimensions.paddingSizeSmall),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: poppinsMedium.copyWith(
                          fontSize: Dimensions.fontSizeDefault,
                          color:Get.isDarkMode ? Theme.of(context).primaryColorLight:Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.8)
                      )
                    ),
                    const SizedBox(height: Dimensions.paddingSizeSmall,),
                    Text(
                      userTypeImage,
                      style: poppinsRegular.copyWith(
                          fontSize: Dimensions.fontSizeSmall,
                          color:Get.isDarkMode ? Theme.of(context).primaryColorLight : Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6) ),),
                  ],
                )
            ),
            Text( DateConverter.dateMonthYearTimeTwentyFourFormat(DateConverter.isoUtcStringToLocalDate(channelupdatedAt)),
                textDirection: TextDirection.ltr,
                style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall,

              color:Get.isDarkMode ? Theme.of(context).primaryColorLight : Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),)),
            const SizedBox(width: Dimensions.paddingSizeSmall,),
          ],
        ),
      ),
    );
  }
}

