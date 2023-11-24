import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/feature/startUpPages/service/forget_passsword_auth.dart';

class ForgetPasswordController extends GetxController {
  // form key
  final forgetPasswordFormKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailEditingController = TextEditingController();

  RxBool checkedValue = false.obs;
  RxBool checkboxValue = false.obs;

  RxBool isSigningUp = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {}

  Future<void> resetPassword() async {
    isSigningUp.value = true;
    if (forgetPasswordFormKey.currentState!.validate()) {
      await ForgetPasswordAuth().forgetPassword(userEmail: emailEditingController.text);
    }
    isSigningUp.value = false;
  }
}
