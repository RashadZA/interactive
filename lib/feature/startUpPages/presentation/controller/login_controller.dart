import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    if (formKey.currentState!.validate()) {}
    isSigning.value = false;
  }
}
