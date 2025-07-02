import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_app_bar.dart';
import 'package:lms_user_app/controller/user_controller.dart';
import 'package:lms_user_app/core/helper/help_me.dart';
import 'package:lms_user_app/feature/conversation/controller/conversation_controller.dart';
import 'package:lms_user_app/feature/conversation/model/conversation_user.dart';
import 'package:lms_user_app/feature/conversation/widgets/channel_item.dart';
import 'package:lms_user_app/feature/conversation/widgets/inbox_shimmer.dart';
import 'package:lms_user_app/feature/root/view/no_data_screen.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/styles.dart';

class ChannelList extends GetView<ConversationController> {
  const ChannelList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //String imageBaseUrl = "";

    return Scaffold(
      appBar: CustomAppBar(title: 'inbox'.tr, isBackButtonExist: true,),
      body: GetBuilder<ConversationController>(
        initState:(state) {
          Get.find<ConversationController>().getChannelList(1);
          Get.find<UserController>().getUserInfo();
        },
        builder: (conversationController){
            return SizedBox(
                child: conversationController.channelList == null ?
                const InboxShimmer() :
                conversationController.channelList!.isNotEmpty ?
                Column(
                  children: [
                    const SizedBox(height: Dimensions.paddingSizeSmall,),
                    ListView.builder(
                        controller: conversationController.scrollController,
                        itemCount: controller.channelList!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          /*bool user = controller.channelList![index].channelUsers![0].user != null &&  controller.channelList![index].channelUsers![1].user != null;
                          int? _isRead;
                          if(user){
                            _isRead = controller.channelList![index].channelUsers![0].user!.userType == "customer" ?
                            controller.channelList![index].channelUsers![0].isRead! : controller.channelList![index].channelUsers![1].isRead!;
                          }*/

                          //bool xyz = controller.channelList![index].channelUsers![0].user != null &&  controller.channelList![index].channelUsers![1].user != null;
                          return ChannelItem(
                            // conversationUserModel:  controller.channelList![index].channelUsers![0].user!.userType != "customer" ?
                            conversationUserModel:  ConversationUserModel(),
                            channelupdatedAt: controller.channelList!.elementAt(index).updatedAt!,
                            isRead: 1,
                            bookingID: controller.channelList!.elementAt(index).referenceId??'',
                          );
                        }
                    ),
                  ],
                ):
                NoDataScreen(text: 'your_inbox_list_empty'.tr,type: NoDataType.inbox,)
            );
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: (){
          if(isRedundentClick(DateTime.now())){
            return;
          }
          String userId = "";
          String name = "";
          String image = "";
          Get.find<ConversationController>().createChannel(userId, "",name: name,image: image);
        },
        child: Container(
          height: 45,
          width: 180,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(50)
          ),

          child: Center(
            child: Text('chat_with_admin'.tr,
              style: poppinsMedium.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: Theme.of(context).primaryColorLight),
            ),
          ),
        ),
      ),
    );
  }
}
