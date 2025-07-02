import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/components/custom_image.dart';
import 'package:lms_user_app/controller/localization_controller.dart';
import 'package:lms_user_app/core/helper/responsive_helper.dart';
import 'package:lms_user_app/feature/conversation/model/conversation_model.dart';
import 'package:lms_user_app/utils/dimensions.dart';

class ConversationBubble extends StatefulWidget {
  final ConversationData conversationData;
  final bool isRightMessage;
  final String oppositeName;
  final String oppositeImage;

  const ConversationBubble(
      {super.key,
      required this.conversationData,
      required this.isRightMessage,
      required this.oppositeName,
      required this.oppositeImage});

  @override
  State<ConversationBubble> createState() => _ConversationBubbleState();
}

class _ConversationBubbleState extends State<ConversationBubble> {
  @override
  void initState() {
    super.initState();
    if (ResponsiveHelper.isMobile(Get.context)) {
      ReceivePort _port = ReceivePort();
      IsolateNameServer.registerPortWithName(
          _port.sendPort, 'downloader_send_port');
      _port.listen((dynamic data) {
        setState(() {});
      });

      FlutterDownloader.registerCallback(downloadCallback as DownloadCallback);
    }
  }

  @override
  void dispose() {
    if (ResponsiveHelper.isMobile(Get.context)) {
      IsolateNameServer.removePortNameMapping('downloader_send_port');
    }
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    //String imagePath = "";
    String image = '';

    // if(widget.conversationData.user!.provider != null){
    //   print(widget.conversationData.user!.provider!.companyName!);
    //   image = "";
    // }else{
    //   image = "";
    // }

    return Column(
      crossAxisAlignment: widget.isRightMessage
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: widget.isRightMessage
              ? const EdgeInsets.fromLTRB(20, 5, 5, 5)
              : const EdgeInsets.fromLTRB(5, 5, 20, 5),
          child: Column(
            crossAxisAlignment: widget.isRightMessage
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: [
              //Name
              widget.conversationData.user == null
                  ? Row(
                      mainAxisAlignment: widget.isRightMessage
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        // Text(widget.isRightMessage ?'${Get.find<UserController>().userInfoModel.f!} ${Get.find<UserController>().userInfoModel.lName}' :widget.oppositeName ),
                        Text("name"),
                      ],
                    )
                  : const SizedBox(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: widget.isRightMessage
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  //Avater for Right
                  widget.isRightMessage
                      ? const SizedBox()
                      : Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CustomImage(
                                  height: 30,
                                  width: 30,
                                  image: widget.oppositeImage),
                            ),
                          ],
                        ),
                  const SizedBox(
                    width: Dimensions.paddingSizeSmall,
                  ),
                  //Message body
                  Flexible(
                    child: Column(
                      crossAxisAlignment: widget.isRightMessage
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.conversationData.message == null)
                          Flexible(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).hoverColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    widget.conversationData.message != null
                                        ? Dimensions.paddingSizeDefault
                                        : 0),
                                child:
                                    Text(widget.conversationData.message ?? ''),
                              ),
                            ),
                          ),
                        /*if(widget.conversationData.conversationFile!.isNotEmpty) const SizedBox(height: Dimensions.paddingSizeSmall),
                        widget.conversationData.conversationFile!.isNotEmpty?
                        Directionality(
                          textDirection:Get.find<LocalizationController>().isLtr ? widget.isRightMessage ? TextDirection.rtl: TextDirection.ltr : widget.isRightMessage ?TextDirection.ltr : TextDirection.rtl,
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1,
                                crossAxisCount: 3,
                                mainAxisSpacing: Dimensions.paddingSizeSmall,
                                crossAxisSpacing: Dimensions.paddingSizeSmall,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.conversationData.conversationFile!.length,
                            itemBuilder: (BuildContext context, index){
                              return widget.conversationData.conversationFile![index].fileType == 'png' || widget.conversationData.conversationFile![index].fileType == 'jpg'?
                              InkWell(
                                onTap: () => showDialog(context: context, builder: (ctx)  =>
                                    const ImageDialog(imageUrl: ''), ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child:
                                  FadeInImage.assetNetwork(
                                    placeholder: Images.logo, height: 100, width: 100, fit: BoxFit.cover,
                                    image: Images.logo,
                                    imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholderSquare, height: 100, width: 100, fit: BoxFit.cover),
                                  ),
                                ),
                              ) :
                              InkWell(
                                onTap : () async {
                                  */ /*if(ResponsiveHelper.isMobile(context)){
                                    final status = await Permission.storage.request();
                                    if(status.isGranted){
                                      Directory? directory = Directory('/storage/emulated/0/Download');
                                      if (!await directory.exists()) directory = Platform.isAndroid
                                          ? await getExternalStorageDirectory() //FOR ANDROID
                                          : await getApplicationSupportDirectory();
                                      //Get.find<ConversationController>().downloadFile('${Get.find<SplashController>().configModel.content!.imageBaseUrl}/conversation/${widget.conversationData.conversationFile![index].fileName ?? ''}',directory!.path);
                                    }else{
                                      print('=====permission denied=====');
                                    }
                                  }else{
                                    //Get.find<ConversationController>().downloadFileForWeb('${Get.find<SplashController>().configModel.content!.imageBaseUrl}/conversation/${widget.conversationData.conversationFile![index].fileName ?? ''}');
                                  }*/ /*
                                },
                                child: Container(height: 50,width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context).hoverColor
                                  ),
                                  child: Stack(
                                    children: [
                                      Center(child: SizedBox(width: 50, child: Image.asset(Images.logo))),
                                      Center(
                                        child: Text('${widget.conversationData.conversationFile![index].fileName}'.substring(widget.conversationData.conversationFile![index].fileName!.length-7),
                                          maxLines: 5, overflow: TextOverflow.clip,),
                                      ),
                                    ],
                                  ),),
                              );
                            },
                          ),
                        ):*/
                        const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  widget.isRightMessage
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child:
                              CustomImage(height: 30, width: 30, image: image),
                        )
                      : const SizedBox(),
                ],
              ),
              //Gaps.verticalGapOf(Dimensions.PADDING_SIZE_EXTRA_SMALL),
            ],
          ),
        ),
        Padding(
            padding: Get.find<LocalizationController>().isLtr
                ? widget.isRightMessage
                    ? const EdgeInsets.fromLTRB(5, 5, 50, 5)
                    : const EdgeInsets.fromLTRB(50, 5, 5, 5)
                : const EdgeInsets.fromLTRB(50, 5, 5, 5),
            child: const Text("12:34 pm",
                style: TextStyle(fontSize: 8.0),
                textDirection: TextDirection.ltr)),
      ],
    );
  }
}
