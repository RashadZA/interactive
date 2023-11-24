import 'package:get/get.dart';
import 'package:interactive/core/routes/app_pages.dart';
import 'package:interactive/core/storageService/get_storage.dart';
import 'package:interactive/core/widgets/user_model.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    UserModel? user = GSServices.getUser;
    if(user?.signIn == true){
      Get.offAllNamed(Routes.dashBoard);
    }else{
      Get.offAllNamed(Routes.login);
    }
  }
}