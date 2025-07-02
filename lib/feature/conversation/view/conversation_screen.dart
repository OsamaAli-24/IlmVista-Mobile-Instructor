import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_image.dart';
import 'package:lms_user_app/components/custom_snackbar.dart';
import 'package:lms_user_app/feature/conversation/controller/conversation_controller.dart';
import 'package:lms_user_app/feature/conversation/model/conversation_model.dart';
import 'package:lms_user_app/feature/conversation/widgets/chatting_shimmer.dart';
import 'package:lms_user_app/feature/conversation/widgets/message_widget.dart';
import 'package:lms_user_app/utils/dimensions.dart';
import 'package:lms_user_app/utils/images.dart';
import 'package:lms_user_app/utils/styles.dart';

class ConversationScreen extends StatefulWidget {
  final String channelID;
  final String name;
  final String image;
  final String date;
  final String bookingID;

  const ConversationScreen({
    super.key,
    required this.name,
    required this.image,
    required this.channelID,
    required this.date,
    required this.bookingID});
  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color:Theme.of(context).primaryColorLight),
          color: Theme.of(context).textTheme.bodyLarge!.color,
          onPressed: () => Navigator.pop(context),
        ) ,
        title: Text('conversation'.tr,
            style: poppinsBold.copyWith(
                fontSize: Dimensions.fontSizeLarge,
                color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CustomImage(image: Images.logo),
              ),
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeSmall,)
        ],
      ),

      body: GetBuilder<ConversationController>(
          initState: (state) {
            // Get.find<ConversationController>().cleanOldData();
            // Get.find<ConversationController>().setChannelId("widget.channelID");
            // Get.find<ConversationController>().getConversation("widget.channelID", 1,isInitial:true);
          },
          builder: (conversationController) {
            if(conversationController.conversationList == null){
             // List<ConversationData>? conversationList = conversationController.conversationList!;
              //String customerID = Get.find<UserController>().userInfoModel.id?? '';
              return Container(
                height: null,
                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: Dimensions.paddingSizeSmall,),

                    //if(ResponsiveHelper.isWeb() && !ResponsiveHelper.isMobile(context) && !ResponsiveHelper.isTab(context))
                      Text('conversation'.tr,
                        style: poppinsRegular.copyWith(
                            fontSize: Dimensions.fontSizeSmall,
                            color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(.5),
                        ),
                        textDirection: TextDirection.ltr,
                      ),
                    // if(ResponsiveHelper.isWeb() && !ResponsiveHelper.isMobile(context) && !ResponsiveHelper.isTab(context))
                    //   SizedBox(height: Dimensions.paddingSizeSmall,),
                    // Text('${DateConverter.dateMonthYearTimeTwentyFourFormat(DateConverter.isoUtcStringToLocalDate(widget.date))}',
                    //   style: ubuntuMedium.copyWith(
                    //       fontSize: Dimensions.fontSizeSmall,
                    //       color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(.5)),
                    //   textDirection: TextDirection.ltr,
                    // ),
                    Expanded(
                      child: ListView.builder(
                          itemCount:  2,
                          reverse: true,
                          itemBuilder: (context,index){
                            return ConversationBubble(
                              conversationData: ConversationData(
                              ),
                              oppositeName: "widget.name $index",
                              oppositeImage: Images.logo,
                              isRightMessage: true,
                            );
                          },
                      ),
                    ),
                    Column(
                      children: [
                        conversationController.pickedImageFile != null && conversationController.pickedImageFile!.isNotEmpty ?
                        SizedBox(
                          height: 90,
                          width: Get.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return  Stack(children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: Image.file(
                                        File(conversationController.pickedImageFile![index].path),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: InkWell(
                                    child: const Icon(Icons.cancel_outlined, color: Colors.red),
                                    onTap: () {
                                      conversationController.pickMultipleImage(true,index: index);
                                    },
                                  ),
                                )
                              ],
                              );
                            },
                            itemCount: conversationController.pickedImageFile!.length,
                          ),
                        ) :
                        const SizedBox(),
                        conversationController.otherFile != null ?
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 25),
                                  child: Center(child: Text(conversationController.otherFile!.names.elementAt(0).toString()))),
                              InkWell(
                                child: const Icon(Icons.cancel_outlined, color: Colors.red),
                                onTap: () {
                                  conversationController.pickOtherFile(true);
                                },
                              )
                            ],
                          ),
                        ):
                        const SizedBox(),
                        SizedBox(
                          height:60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                                child: InkWell(
                                  child: SvgPicture.asset(
                                    Images.addition,
                                    width: 20.0,
                                    height: 20.0,
                                  ),
                                  onTap: () => conversationController.pickMultipleImage(false),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  //height: 36,
                                  margin: const EdgeInsets.only(
                                      left: Dimensions.paddingSizeExtraSmall,
                                      right: Dimensions.paddingSizeSmall,
                                      bottom: Dimensions.paddingSizeSmall
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                                      boxShadow: Get.isDarkMode?null:shadow,
                                      color: Theme.of(context).cardColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(Dimensions.radiusExtraMoreLarge)
                                      )
                                  ),
                                  child: Form(
                                    key: conversationController.conversationKey,
                                    child: Row(
                                        children: [
                                      const SizedBox(width: Dimensions.paddingSizeDefault),
                                      Expanded(
                                        child: TextField(
                                          controller: conversationController.conversationController,
                                          textCapitalization: TextCapitalization.sentences,
                                          cursorColor: Theme.of(context).hintColor,
                                          style: poppinsMedium.copyWith(
                                              fontSize: Dimensions.fontSizeSmall,
                                              color:Theme.of(context).textTheme.bodyLarge!.color!,
                                          ),
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "type_here".tr,
                                            hintStyle: poppinsRegular.copyWith(
                                                color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.6),
                                                fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                                        child: InkWell(
                                          child: SvgPicture.asset(
                                            Images.emoji,
                                            width: 20.0,
                                            height: 20.0,
                                          ),
                                          onTap: () => conversationController.pickMultipleImage(false),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    child: SvgPicture.asset(
                                      Images.microphoneChat,
                                      width: 20.0,
                                      height: 20.0,
                                    ),
                                    onTap: () => conversationController.pickOtherFile(false),
                                  ),
                                  conversationController.isLoading! ?
                                  Container(
                                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                                      height: 20, width: 40,
                                      child: const Center(child: CircularProgressIndicator())) :
                                  InkWell(
                                    onTap: (){
                                      if(conversationController.conversationController.text.isEmpty
                                          && conversationController.pickedImageFile!.isEmpty
                                          && conversationController.otherFile==null){
                                        customSnackBar("write_something".tr);
                                      }
                                      else if(conversationController.conversationKey.currentState!.validate()){
                                        conversationController.sendMessage("widget.channelID");
                                      }
                                      conversationController.conversationController.clear();
                                    },
                                    child:  Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: Dimensions.paddingSizeSmall,
                                      ),
                                      child: SvgPicture.asset(Images.sendMessage),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }else{
              return const ChattingShimmer();
            }
          }),
    );
  }
}
