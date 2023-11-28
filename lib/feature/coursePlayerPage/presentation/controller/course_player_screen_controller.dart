import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:interactive/core/utils/design_utils.dart';
import 'package:interactive/feature/coursePlayerPage/data/bookmark_data_table.dart';
import 'package:interactive/feature/coursePlayerPage/data/module_status_data_table.dart';
import 'package:interactive/feature/coursePlayerPage/model/module_model.dart';
import 'package:interactive/feature/coursePlayerPage/presentation/widgets/bookmark_list_dialog.dart';
import 'package:interactive/feature/dashBoard/data/course_data.dart';
import 'package:interactive/feature/dashBoard/model/course_list_model.dart';
import 'package:video_player/video_player.dart';

/// GetX 4th Code
// class CoursePlayerScreenController extends GetxController {
//   VideoPlayerController videoPlayerController = VideoPlayerController.asset(defaultLoadingVideoPath)..initialize();
//   RxList<ModuleModel> moduleList = <ModuleModel>[].obs;
//   RxInt currentModuleIndex = 0.obs;
//   RxList<double> bookmarks = <double>[].obs;
//
//
//   RxBool dataIsLoading = false.obs;
//   RxBool videoIsLoading = false.obs;
//   RxBool videoIsPlaying = false.obs;
//   @override
//   void onInit() {
//     super.onInit();
//     init();
//   }
//
//
//
//   Future<void> init() async {
//     print("Init started");
//     await getData();
//     await loadVideo(path: "$moduleAssetPath/${moduleList[0].courseKey}/${moduleList[0].courseModuleKey}.mp4");
//     print("Init completed");
//     update();
//   }
//
//   Future<void> getData() async {
//     dataIsLoading.value = true;
//     List<dynamic> argumentData = Get.arguments;
//     update();
//     print("Argument Data: $argumentData");
//     moduleList.value =
//         argumentData.map((module) => ModuleModel.fromMap(module)).toList();
//     dataIsLoading.value = false;
//     update();
//   }
//
//   Future<void> loadVideo({required String path}) async {
//     try {
//       videoIsLoading.value = true;
//       await videoPlayerController.dispose(); // Dispose the previous instance
//       videoPlayerController = VideoPlayerController.asset(path);
//       await videoPlayerController.initialize();
//     } catch (error) {
//       "Error loading video: $error".errorSnackBar();
//       print("Error loading video: $error");
//     } finally {
//       videoIsLoading.value = false;
//       update();
//     }
//   }
//
//
//   Future<void> previousButtonOnPressed() async {
//     videoPlayerController.pause();
//     update();
//     if (currentModuleIndex > 0) {
//       currentModuleIndex--;
//       update();
//       await loadVideo(path: "$moduleAssetPath/${moduleList[currentModuleIndex.value].courseKey}/${moduleList[currentModuleIndex.value].courseModuleKey}.mp4");
//     }
//   }
//   Future<void> pauseButtonOnPressed() async {
//     if (videoPlayerController.value.isPlaying) {
//       videoIsPlaying.value = false;
//       videoPlayerController.pause();
//       update();
//     } else {
//       videoIsPlaying.value = true;
//       videoPlayerController.play();
//       update();
//     }
//
//   }
//   Future<void> nextButtonOnPressed() async {
//     videoPlayerController.pause();
//     update();
//     if (currentModuleIndex < moduleList.length - 1) {
//       currentModuleIndex++;
//       await loadVideo(path: "$moduleAssetPath/${moduleList[currentModuleIndex.value].courseKey}/${moduleList[currentModuleIndex.value].courseModuleKey}.mp4");
//       update();
//
//     }
//   }
//
//   String formatDuration(Duration duration) {
//     String formatTime = '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
//     update();
//     return formatTime;
//   }
//
//   Future<void> bookMarkButtonOnPressed() async {
//     bookmarks.add(videoPlayerController.value.position.inSeconds.toDouble());
//     update();
//   }
//
//   void seekForward() {
//     final currentPosition = videoPlayerController.value.position;
//     final newPosition = currentPosition + const Duration(seconds: 10); // You can adjust the duration as needed
//     videoPlayerController.seekTo(newPosition);
//     update();
//   }
//
//   void seekBackward() {
//     final currentPosition = videoPlayerController.value.position;
//     final newPosition = currentPosition - const Duration(seconds: 10); // You can adjust the duration as needed
//     videoPlayerController.seekTo(newPosition);
//     update();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//     videoPlayerController.dispose();
//   }
// }

/// Calculating watch time of every videos
class CoursePlayerScreenController extends GetxController {
  VideoPlayerController videoPlayerController =
      VideoPlayerController.asset(defaultLoadingVideoPath)..initialize();
  RxList<ModuleModel> moduleList = <ModuleModel>[].obs;
  RxInt currentModuleIndex = 0.obs;
  RxList<double> bookmarks = <double>[].obs;
  RxList completedModulesList = [].obs;
  RxBool dataIsLoading = false.obs;
  RxBool videoIsLoading = false.obs;
  RxBool videoIsPlaying = false.obs;
  RxBool isCertificateAvailable = false.obs;

  Duration? videoStartTime; // Variable to store the start time

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    print("Init started");
    await getData();
    await loadVideo(
        path:
            "$moduleAssetPath/${moduleList[0].courseKey}/${moduleList[0].courseModuleKey}.mp4");
    print("Init completed");
    update();
  }

  Future<void> getData() async {
    dataIsLoading.value = true;
    List<dynamic> argumentData = Get.arguments;
    update();
    print("Argument Data: $argumentData");
    completedModulesList.value =
        await ModuleStatusDataFromDatabase().getModuleKeyList();
    moduleList.value =
        argumentData.map((module) => ModuleModel.fromMap(module)).toList();

    dataIsLoading.value = false;
    update();
  }

  Future<void> loadVideo({required String path}) async {
    try {
      videoIsLoading.value = true;
      await videoPlayerController.dispose(); // Dispose the previous instance
      videoPlayerController = VideoPlayerController.asset(path)
        ..initialize()
        ..addListener(() {
          // Track the start time when the video starts playing
          if (videoPlayerController.value.isPlaying && videoStartTime == null) {
            videoStartTime = videoPlayerController.value.position;
          }
          // Check if the video has ended
          if (videoPlayerController.value.position >=
              videoPlayerController.value.duration) {
            onVideoEnd();
          }
        });
    } catch (error) {
      "Error loading video: $error".errorSnackBar();
      print("Error loading video: $error");
    } finally {
      videoIsLoading.value = false;
      update();
    }
  }

  Future<void> onVideoEnd() async {
    // Calculate and log the watch time when the video ends
    final endTime = videoPlayerController.value.position;
    if (videoStartTime != null) {
      final watchTime = endTime - videoStartTime!;
      print("Watch Time: $watchTime");
      await ModuleStatusDataFromDatabase()
          .makeDesitionForInsertOrUpdateDataInDatabase(
        moduleModel: moduleList[currentModuleIndex.value],
        moduleDuration: formatDuration(videoPlayerController.value.duration),
        moduleWatchTime: formatDuration(watchTime),
        moduleWatchStatus: videoPlayerController.value.duration == watchTime
            ? "Done"
            : "Remain",
      );
      if (completedModulesList.length == moduleList.length) {
        "Tap For Claiming Your Certificate."
            .successSnackBar(onTap: (_) => Get.back());
      }
    }

    // Reset the start time for the next video
    videoStartTime = null;
    nextButtonOnPressed();
    update();
  }

  Future<void> previousButtonOnPressed() async {
    videoPlayerController.pause();
    update();
    if (currentModuleIndex > 0) {
      currentModuleIndex--;
      update();
      await loadVideo(
          path:
              "$moduleAssetPath/${moduleList[currentModuleIndex.value].courseKey}/${moduleList[currentModuleIndex.value].courseModuleKey}.mp4");
    }
    checkingVideoStatus();
  }

  Future<void> pauseButtonOnPressed() async {
    if (videoPlayerController.value.isPlaying) {
      videoIsPlaying.value = false;
      videoPlayerController.pause();
      update();
    } else {
      videoIsPlaying.value = true;
      videoPlayerController.play();
      update();
    }
    checkingVideoStatus();
  }

  Future<void> nextButtonOnPressed() async {
    videoPlayerController.pause();
    update();
    if (currentModuleIndex < moduleList.length - 1) {
      currentModuleIndex++;
      await loadVideo(
          path:
              "$moduleAssetPath/${moduleList[currentModuleIndex.value].courseKey}/${moduleList[currentModuleIndex.value].courseModuleKey}.mp4");
      update();
    }
    checkingVideoStatus();
  }

  String formatDuration(Duration duration) {
    String formatTime =
        '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    update();
    return formatTime;
  }

  Future<void> bookMarkButtonOnPressed() async {
    bookmarks.add(videoPlayerController.value.position.inSeconds.toDouble());
    await BookMarkDataFromDatabase().insertBookMarkData(
      moduleModel: moduleList[currentModuleIndex.value],
      moduleDuration: formatDuration(videoPlayerController.value.duration),
      moduleBookMarkTime: formatDuration(videoPlayerController.value.position),
    );
    update();
  }


  Future<void> bookMarkListButtonOnPressed({required BuildContext context}) async {
    List data = await BookMarkDataFromDatabase().getBookMarkDetailsAccordingToModuleKey(moduleKey: "${moduleList[currentModuleIndex.value].courseModuleKey}");
    update();
    showBookmarksDialog(context: context, bookmarks: data);
  }


  Future<void> seekForward() async {
    final currentPosition = videoPlayerController.value.position;
    final newPosition = currentPosition +
        const Duration(seconds: 10); // You can adjust the duration as needed
    videoPlayerController.seekTo(newPosition);
    checkingVideoStatus();
    update();
  }

  Future<void> seekBackward() async {
    final currentPosition = videoPlayerController.value.position;
    final newPosition = currentPosition -
        const Duration(seconds: 10); // You can adjust the duration as needed
    videoPlayerController.seekTo(newPosition);
    checkingVideoStatus();
    update();
  }

  Future<void> checkingVideoStatus() async {
    if (videoPlayerController.value.isPlaying) {
      videoIsPlaying.value = true;
    } else {
      videoIsPlaying.value = false;
    }
    update();
  }

  checkingModuleIsCompletedOrNot({required String courseModuleKey}) {
    bool completedStatus =
        completedModulesList.contains({"courseModuleKey": courseModuleKey});
    update();
    return completedStatus;
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController.dispose();
  }
}
