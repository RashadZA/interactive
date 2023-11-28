import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/core/utils/design_utils.dart';
import 'package:interactive/feature/coursePlayerPage/presentation/controller/course_player_screen_controller.dart';
import 'package:video_player/video_player.dart';

class CoursePlayerScreen extends GetWidget<CoursePlayerScreenController> {
  const CoursePlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Course Player",
          style: AppTextTheme.text22.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Obx(() => controller.completedModulesList.length ==
                  controller.moduleList.length
              ? IconButton(
                  onPressed: () =>  "Tap For Claiming Your Certificate.".successSnackBar(onTap: (_) => Get.back()),
                  icon: const Icon(
                    Icons.celebration_outlined,
                    color: AppColors.white,
                  ),
                )
              : Container())
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return SingleChildScrollView(
            child: Obx(() {
              return Column(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: orientation == Orientation.landscape ? 455 : 525,
                    child: controller.videoIsLoading.isTrue
                        ? Center(
                            child: const CircularProgressIndicator()
                                .defaultContainer(),
                          )
                        : Column(
                            children: [
                              SizedBox(
                                width: Get.width,
                                height: orientation == Orientation.landscape
                                    ? 330
                                    : 400,
                                child: AspectRatio(
                                  aspectRatio: controller
                                      .videoPlayerController.value.aspectRatio,
                                  child: VideoPlayer(
                                    controller
                                        .videoPlayerController, // Add onEnd callback
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Duration: ${controller.formatDuration(controller.videoPlayerController.value.duration)}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Paused at: ${controller.formatDuration(controller.videoPlayerController.value.position)}',
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.fast_rewind),
                                    onPressed: () => controller.seekBackward(),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.fast_forward),
                                    onPressed: () => controller.seekForward(),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.skip_previous),
                                    onPressed: () =>
                                        controller.previousButtonOnPressed(),
                                  ),
                                  IconButton(
                                    icon: Icon(controller.videoIsPlaying.isTrue
                                        ? Icons.pause
                                        : Icons.play_arrow),
                                    onPressed: () =>
                                        controller.pauseButtonOnPressed(),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.skip_next),
                                    onPressed: () =>
                                        controller.nextButtonOnPressed(),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.bookmark),
                                    onPressed: () =>
                                        controller.bookMarkButtonOnPressed(),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.bookmarks),
                                    onPressed: () =>controller.bookMarkListButtonOnPressed(context: context),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ),
                  controller.dataIsLoading.isTrue
                      ? Center(
                          child: SizedBox(
                          width: 50,
                          height: 50,
                          child: defaultLoader(color: AppColors.primaryColor),
                        ).defaultContainer())
                      : Column(
                          children: controller.moduleList
                              .map((module) => Column(children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: Get.width,
                                      child: Text(
                                        "${module.courseModuleName}",
                                      ).defaultContainer(
                                          backgroundColor: module
                                                      .courseModuleKey ==
                                                  controller
                                                      .moduleList[controller
                                                          .currentModuleIndex
                                                          .value]
                                                      .courseModuleKey
                                              ? AppColors.primaryColor
                                              : null),
                                    ).paddingOnly(left: 10, right: 10),
                                  ]))
                              .toList(),
                        ),
                  const SizedBox(height: 20,),
                ],
              );
            }),
          );
        },
      ),
    );
  }

}