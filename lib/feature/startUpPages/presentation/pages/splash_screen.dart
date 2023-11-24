import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/core/Utils/design_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

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
            AppColors.gradientEndColor,
            AppColors.gradientCenterColor,
          ],
        ),
      ),
      child:  Center(
        child: ShakeY(
          infinite: true,
          duration: const Duration(seconds: 20),
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
