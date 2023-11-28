import 'dart:async';

import 'package:get/get.dart';
import 'package:interactive/core/routes/app_pages.dart';
import 'package:interactive/core/widgets/user_model.dart';
import 'package:interactive/feature/startUpPages/data/user_data.dart';

class SplashScreenController extends GetxController {

  RxList userDetails = [].obs;
  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    userDetails.value = await UserDataFromDatabase().getUserDetails();
    if(userDetails.isNotEmpty){
      if( userDetails[0]['signIn'] == "Yes"){
        Get.offAllNamed(Routes.dashBoard);
      }else{
        Get.offAllNamed(Routes.login);
      }
    }else{
      Get.offAllNamed(Routes.login);
    }

  }
}