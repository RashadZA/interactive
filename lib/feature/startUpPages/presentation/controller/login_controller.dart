import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/core/utils/design_utils.dart';
import 'package:interactive/feature/startUpPages/data/login_auth.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginController extends GetxController {
  // form key
  final formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool obscureText = true.obs;

  RxBool isSigning = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {}
  Future<void> changePasswordVisibilityStatus({required bool status}) async {
    obscureText.value = !status;
    update();
  }

  Future<void> signIn() async {
    isSigning.value = true;

      if (formKey.currentState!.validate()) {
        PermissionStatus status = await Permission.storage.status;
        debugPrint("status : $status");
        update();
        if (!status.isGranted) {
          await Permission.storage.request();
          status = await Permission.storage.status;
          update();
          if(status.isDenied || status.isPermanentlyDenied){
            "Please give storage permission from setting".infoSnackBar();
          }
        }else{
          await LoginAuth().signIn(
              email: emailController.text, password: passwordController.text);
        }

      }

    isSigning.value = false;
    update();
  }
}
