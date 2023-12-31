import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/core/Utils/design_utils.dart';
import 'package:interactive/feature/startUpPages/presentation/controller/splash_screen_controller.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.gradientStartColor,
            AppColors.gradientCenterColor,
            AppColors.gradientEndColor,
          ],
        ),
      ),
      child: Center(
        child: ShakeY(
          infinite: true,
          duration: const Duration(seconds: 2),
          child: const CircleAvatar(
            radius: 60,
            backgroundColor: AppColors.white,
            child: Icon(
              Icons.flutter_dash_outlined,
              color: AppColors.primaryColor,
              size: 100,
            ),
          ),
        ),
      ),
    );
  }
}
