import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/feature/startUpPages/service/login_auth.dart';

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
      await LoginAuth().signIn(
          email: emailController.text, password: passwordController.text);
    }
    isSigning.value = false;
  }
}
