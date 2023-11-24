import 'package:get/get.dart';
import 'package:interactive/feature/dashBoard/data/course_data.dart';
import 'package:interactive/feature/dashBoard/model/course_list_model.dart';
import 'package:video_player/video_player.dart';

class CoursePlayerScreenController extends GetxController {
  late VideoPlayerController videoPlayerController;
  List<String> modules = ['Module 1', 'Module 2', 'Module 3'];
  int currentModuleIndex = 0;
  List<double> bookmarks = [];
  @override
  void onInit() {
    super.onInit();
    init();
  }



  Future<void> init() async {
    videoPlayerController =  VideoPlayerController.networkUrl(
      Uri.parse('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4'),
    )..initialize();
    update();
  }
}
