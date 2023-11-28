// import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/core/utils/design_utils.dart';
import 'package:interactive/feature/coursePlayerPage/model/module_model.dart';
import 'package:interactive/feature/coursePlayerPage/presentation/controller/course_player_screen_controller.dart';
import 'package:interactive/feature/dashBoard/presentation/widgets/dashboard_course_card.dart';
import 'package:video_player/video_player.dart';

/// First GetX code
// class CoursePlayerScreen extends GetWidget<CoursePlayerScreenController> {
//   const CoursePlayerScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Course Player",
//           style: AppTextTheme.text22.copyWith(
//             color: AppColors.white,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       body: Obx(() => OrientationBuilder(
//         builder: (context, orientation){
//           return FutureBuilder(future: controller.ivpf, builder: (context, snapshot){
//             if(snapshot.connectionState == ConnectionState.done){
//               return Column(
//                 children: [
//                   AspectRatio(
//                     aspectRatio: controller.videoPlayerController.value.aspectRatio,
//                     child: VideoPlayer(controller.videoPlayerController),
//                   ),
//                   ListTile(
//                     title: Text(controller.modules[controller.currentModuleIndex]),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.skip_previous),
//                         onPressed: () {
//                           controller.videoPlayerController.pause();
//                           if (controller.currentModuleIndex > 0) {
//
//                             controller.currentModuleIndex--;
//                             controller.update();
//                           }
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(controller.videoPlayerController.value.isPlaying
//                             ? Icons.pause
//                             : Icons.play_arrow),
//                         onPressed: () {
//                           if (controller.videoPlayerController.value.isPlaying) {
//                             controller.videoPlayerController.pause();
//                           } else {
//                             controller.videoPlayerController.play();
//                           }
//
//                         },
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.skip_next),
//                         onPressed: () {
//                           controller.videoPlayerController.pause();
//                           if (controller.currentModuleIndex < controller.modules.length - 1) {
//                             controller.currentModuleIndex++;
//                             controller.update();
//
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.bookmark),
//                         onPressed: () {
//                           controller.bookmarks.add(controller.videoPlayerController.value.position.inSeconds.toDouble());
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.bookmarks),
//                         onPressed: () {
//                           _showBookmarksDialog(context);
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             }else{
//               return  Center(child: const CircularProgressIndicator().defaultContainer(),);
//             }
//           });
//         },
//       )),
//     );
//   }
//   void _showBookmarksDialog(context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Bookmarks'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: controller.bookmarks
//                   .map((time) => ListTile(
//                 title: Text('Bookmark at ${time}s'),
//               ))
//                   .toList(),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
// }

/// GetX 3rd Code
// class CoursePlayerScreen extends GetWidget<CoursePlayerScreenController> {
//   const CoursePlayerScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Course Player",
//           style: AppTextTheme.text22.copyWith(
//             color: AppColors.white,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   width: Get.width,
//                   height: orientation == Orientation.landscape ? 400 : 450,
//                   child: FutureBuilder(
//                       future: controller.ivpf,
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState != ConnectionState.done) {
//                           return Center(
//                             child: const CircularProgressIndicator()
//                                 .defaultContainer(),
//                           );
//                         } else {
//                           return Column(
//                             children: [
//                               SizedBox(
//                                 width: Get.width,
//                                 height: orientation == Orientation.landscape
//                                     ? 330
//                                     : 400,
//                                 child: AspectRatio(
//                                   aspectRatio: controller
//                                       .videoPlayerController.value.aspectRatio,
//                                   child: VideoPlayer(
//                                       controller.videoPlayerController),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   IconButton(
//                                     icon: const Icon(Icons.skip_previous),
//                                     onPressed: () =>
//                                         controller.previousButtonOnPressed(),
//                                   ),
//                                   IconButton(
//                                     icon: Icon(controller.videoPlayerController
//                                             .value.isPlaying
//                                         ? Icons.pause
//                                         : Icons.play_arrow),
//                                     onPressed: () =>
//                                         controller.pauseButtonOnPressed(),
//                                   ),
//                                   IconButton(
//                                     icon: const Icon(Icons.skip_next),
//                                     onPressed: () =>
//                                         controller.nextButtonOnPressed(),
//                                   ),
//                                   IconButton(
//                                     icon: const Icon(Icons.bookmark),
//                                     onPressed: () =>
//                                         controller.bookMarkButtonOnPressed(),
//                                   ),
//                                   IconButton(
//                                     icon: const Icon(Icons.bookmarks),
//                                     onPressed: () {
//                                       _showBookmarksDialog(context);
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           );
//                         }
//                       }),
//                 ),
//                 Obx(
//                   () => controller.isLoading.value == true
//                       ? Center(
//                           child: SizedBox(
//                           width: 50,
//                           height: 50,
//                           child: defaultLoader(color: AppColors.primaryColor),
//                         ).defaultContainer())
//                       : Column(
//                           children: [
//
//                             for (ModuleModel module
//                                 in controller.moduleList) ...[
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               SizedBox(
//                                 width: Get.width,
//                                 child: Text("${module.courseModuleName}")
//                                     .defaultContainer(),
//                               ).paddingOnly(left: 10, right: 10),
//                             ],
//                           ],
//                         ),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   void _showBookmarksDialog(context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Bookmarks'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: controller.bookmarks
//                   .map((time) => ListTile(
//                         title: Text('Bookmark at ${time}s'),
//                       ))
//                   .toList(),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

/// GetX 4th Code
// class CoursePlayerScreen extends GetWidget<CoursePlayerScreenController> {
//   const CoursePlayerScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Course Player",
//           style: AppTextTheme.text22.copyWith(
//             color: AppColors.white,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return SingleChildScrollView(
//             child: Obx(() {
//               print("UI Update: videoIsLoading - ${controller.videoIsLoading}");
//               print("UI Update: dataIsLoading - ${controller.dataIsLoading}");
//               return Column(
//                 children: [
//                   SizedBox(
//                     width: Get.width,
//                     height: orientation == Orientation.landscape ? 410 : 520,
//                     child: controller.videoIsLoading.isTrue ? Center(
//                       child: const CircularProgressIndicator()
//                           .defaultContainer(),
//                     ) : Column(
//                       children: [
//                         SizedBox(
//                           width: Get.width,
//                           height: orientation == Orientation.landscape
//                               ? 330
//                               : 400,
//                           child: AspectRatio(
//                             aspectRatio: controller
//                                 .videoPlayerController.value.aspectRatio,
//                             child: VideoPlayer(
//                                 controller.videoPlayerController),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             children: [
//                               Text(
//                                 'Duration: ${controller.formatDuration(controller.videoPlayerController.value.duration)}',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 'Paused at: ${controller.formatDuration(controller.videoPlayerController.value.position)}',
//                               ),
//                             ],
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceEvenly,
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.fast_rewind),
//                               onPressed: () => controller.seekBackward(),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.fast_forward),
//                               onPressed: () => controller.seekForward(),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.skip_previous),
//                               onPressed: () =>
//                                   controller.previousButtonOnPressed(),
//                             ),
//                             IconButton(
//                               icon: Icon(controller.videoIsPlaying
//                                   .isTrue
//                                   ? Icons.pause
//                                   : Icons.play_arrow),
//                               onPressed: () =>
//                                   controller.pauseButtonOnPressed(),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.skip_next),
//                               onPressed: () =>
//                                   controller.nextButtonOnPressed(),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.bookmark),
//                               onPressed: () =>
//                                   controller.bookMarkButtonOnPressed(),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.bookmarks),
//                               onPressed: () {
//                                 _showBookmarksDialog(context);
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   controller.dataIsLoading.isTrue
//                       ? Center(
//                       child: SizedBox(
//                         width: 50,
//                         height: 50,
//                         child: defaultLoader(color: AppColors.primaryColor),
//                       ).defaultContainer())
//                       : Column(
//                     children: controller.moduleList.map((module) => Column(children: [ const SizedBox(
//                       height: 10,
//                     ),
//                       SizedBox(
//                         width: Get.width,
//                         child: Text("${module.courseModuleName}")
//                             .defaultContainer(backgroundColor: module.courseModuleKey == controller.moduleList[controller.currentModuleIndex.value].courseModuleKey ? AppColors.primaryColor : null),
//                       ).paddingOnly(left: 10, right: 10),],)).toList()
//
//                     ,
//                   )
//                 ],
//               );
//             },
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   void _showBookmarksDialog(context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Bookmarks'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: controller.bookmarks
//                   .map((time) => ListTile(
//                 title: Text('Bookmark at ${time}s'),
//               ))
//                   .toList(),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

/// Calculating watch time of every videos
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
                    height: orientation == Orientation.landscape ? 450 : 520,
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 8),
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

/// Video player codes
// class CoursePlayerScreen extends StatefulWidget {
//
//   const CoursePlayerScreen({super.key});
//
//   @override
//   _CoursePlayerScreenState createState() => _CoursePlayerScreenState();
// }
//
// class _CoursePlayerScreenState extends State<CoursePlayerScreen> {
//   late VideoPlayerController _controller;
//   List<String> modules = ['Module 1', 'Module 2', 'Module 3'];
//   int currentModuleIndex = 0;
//   List<double> bookmarks = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(
//       Uri.parse('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4'),
//     )..initialize().then((_) {
//       setState(() {});
//     }).catchError((error) {
//       print('Video player initialization error: $error');
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Course Player'),
//       ),
//       body: Column(
//         children: [
//           AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           ),
//           ListTile(
//             title: Text(modules[currentModuleIndex]),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.skip_previous),
//                 onPressed: () {
//                   _controller.pause();
//                   if (currentModuleIndex > 0) {
//                     setState(() {
//                       currentModuleIndex--;
//                     });
//                   }
//                 },
//               ),
//               IconButton(
//                 icon: Icon(_controller.value.isPlaying
//                     ? Icons.pause
//                     : Icons.play_arrow),
//                 onPressed: () {
//                   setState(() {
//                     if (_controller.value.isPlaying) {
//                       _controller.pause();
//                     } else {
//                       _controller.play();
//                     }
//                   });
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.skip_next),
//                 onPressed: () {
//                   _controller.pause();
//                   if (currentModuleIndex < modules.length - 1) {
//                     setState(() {
//                       currentModuleIndex++;
//                     });
//                   }
//                 },
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.bookmark),
//                 onPressed: () {
//                   bookmarks.add(_controller.value.position.inSeconds.toDouble());
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.bookmarks),
//                 onPressed: () {
//                   _showBookmarksDialog();
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showBookmarksDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Bookmarks'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: bookmarks
//                   .map((time) => ListTile(
//                 title: Text('Bookmark at ${time}s'),
//               ))
//                   .toList(),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

/// Video Player example
// class CoursePlayerScreen extends StatefulWidget {
//   const CoursePlayerScreen({super.key});
//
//   @override
//   _CoursePlayerScreenState createState() => _CoursePlayerScreenState();
// }
//
// class _CoursePlayerScreenState extends State<CoursePlayerScreen> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(Uri.parse(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         title: const Text('Course Player'),),
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//           aspectRatio: _controller.value.aspectRatio,
//           child: VideoPlayer(_controller),
//         )
//             : CircularProgressIndicator().defaultContainer(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _controller.value.isPlaying
//                 ? _controller.pause()
//                 : _controller.play();
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }

/// Video Player Implement getx
// class CoursePlayerScreen extends GetWidget<CoursePlayerScreenController> {
//    const CoursePlayerScreen({super.key});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//             appBar: AppBar(
//         title: const Text('Course Player'),
//       ),
//       body: Center(
//         child: Obx(() => controller.videoPlayerController.value.isInitialized
//             ? AspectRatio(
//           aspectRatio: controller.videoPlayerController.value.aspectRatio,
//           child: VideoPlayer(controller.videoPlayerController),
//         )
//             : CircularProgressIndicator().defaultContainer(),)
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => controller.floatingButton(),
//         child: Icon(
//           controller.videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }
///appinio video player codes
// class CoursePlayerScreen extends StatefulWidget {
//
//   const CoursePlayerScreen({super.key});
//
//   @override
//   _CoursePlayerScreenState createState() => _CoursePlayerScreenState();
// }
//
// class _CoursePlayerScreenState extends State<CoursePlayerScreen> {
//   late CustomVideoPlayerController _controller;
//   final String path = "assets/videos/bigBuckBunnymp4";
//   @override
//   void initState() {
//     super.initState();
//     init();
//   }
//
//   void init(){
//     VideoPlayerController _vController;
//     _vController = VideoPlayerController.asset(path)..initialize().then((value) {
//       setState(() {
//
//       });
//     });
//     _controller = CustomVideoPlayerController(context: context, videoPlayerController: _vController);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Course Player'),
//       ),
//       body: CustomVideoPlayer(customVideoPlayerController: _controller,),
//     );
//   }
//
//
//
// }
