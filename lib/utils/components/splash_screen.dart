import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashScreenController extends GetxController {
  late VideoPlayerController videoPlayerController;

  @override
  void onInit() {
    super.onInit();
    videoPlayerController =
        VideoPlayerController.asset('assets/image/intro.mp4');
  }
}
