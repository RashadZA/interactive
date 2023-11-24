import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/core/utils/design_utils.dart';
import 'package:interactive/feature/coursePlayerPage/model/course_list_model.dart';
import 'package:interactive/feature/coursePlayerPage/presentation/controller/course_player_screen_controller.dart';
import 'package:interactive/feature/dashBoard/presentation/widgets/dashboard_course_card.dart';
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
      ),
      body: OrientationBuilder(
        builder: (context, orientation){
          return Column(
            children: [
              AspectRatio(
                aspectRatio: controller.videoPlayerController.value.aspectRatio,
                child: VideoPlayer(controller.videoPlayerController),
              ),
              ListTile(
                title: Text(controller.modules[controller.currentModuleIndex]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.skip_previous),
                    onPressed: () {
                      controller.videoPlayerController.pause();
                      if (controller.currentModuleIndex > 0) {

                        controller.currentModuleIndex--;
                        controller.update();
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(controller.videoPlayerController.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow),
                    onPressed: () {
                        if (controller.videoPlayerController.value.isPlaying) {
                          controller.videoPlayerController.pause();
                        } else {
                          controller.videoPlayerController.play();
                        }

                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: () {
                      controller.videoPlayerController.pause();
                      if (controller.currentModuleIndex < controller.modules.length - 1) {
                          controller.currentModuleIndex++;
                          controller.update();

                      }
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.bookmark),
                    onPressed: () {
                      controller.bookmarks.add(controller.videoPlayerController.value.position.inSeconds.toDouble());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.bookmarks),
                    onPressed: () {
                      _showBookmarksDialog(context);
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
  void _showBookmarksDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bookmarks'),
          content: SingleChildScrollView(
            child: Column(
              children: controller.bookmarks
                  .map((time) => ListTile(
                title: Text('Bookmark at ${time}s'),
              ))
                  .toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

}
