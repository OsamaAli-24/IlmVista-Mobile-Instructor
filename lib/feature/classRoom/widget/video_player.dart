import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/controller/video_player_controller.dart';
import 'package:lms_user_app/data/model/course_detail/data.dart';

class CourseVideoPlayer extends GetView<MyVideoPlayerController> {
  final CourseDetailData? data;

  const CourseVideoPlayer({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    controller.initializeVideo(videoLink: data?.videoLink);

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Obx(() => SizedBox(
            width: double.infinity,
            height: size.height * 0.3,
            child: controller.isVideoLoading? const Center(child: CircularProgressIndicator(),):
            controller.isVideoLoaded == true? CustomVideoPlayer(
              customVideoPlayerController: controller.customVideoPlayerController,
            ): const Icon(Icons.ondemand_video_rounded),
          ))
      ),
    );
  }
}

