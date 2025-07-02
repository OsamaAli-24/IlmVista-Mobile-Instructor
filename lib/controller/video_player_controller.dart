import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:get/get.dart';
import 'package:lms_user_app/utils/dev_util.dart';

class MyVideoPlayerController extends GetxController{
  final _isVideoLoaded = RxnBool(null);
  bool? get isVideoLoaded => _isVideoLoaded.value;

  final _isVideoLoading = RxBool(false);
  bool get isVideoLoading => _isVideoLoading.value;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
  const CustomVideoPlayerSettings(
    showSeekButtons: true,
  ); // custom video settings

  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController customVideoPlayerController;

  final String _dummyVideoUrl =
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

  //---------------------------------------------------------------------------initialize all video controllers
  void initializeVideo({String? videoLink}) async {
    _isVideoLoading.value = true;

    try{
      videoPlayerController = VideoPlayerController.network(videoLink ?? _dummyVideoUrl)
        ..initialize()
            .then((value){
          _isVideoLoading.value = false;
          _isVideoLoaded.value = true;

        }).onError((error, stackTrace){
          appLog(tag: "Video Player Error ", msg: error);
          _isVideoLoading.value = false;
          _isVideoLoaded.value = false;
        });
      customVideoPlayerController = CustomVideoPlayerController(
          context: Get.context!,
          videoPlayerController: videoPlayerController,
          customVideoPlayerSettings: _customVideoPlayerSettings);
    }catch(e){
      appLog(tag: 'VideoPlayer', msg: e);
    }finally{
      _isVideoLoading.value = false;
      _isVideoLoaded.value = false;
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    //initializeVideo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    customVideoPlayerController
        .dispose();
    super.dispose();
  }
}