import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  // form key
  final registrationFormKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController firstNameEditingController =
      TextEditingController();

  final TextEditingController secondNameEditingController =
      TextEditingController();

  final TextEditingController mobileNumberEditingController =
      TextEditingController();

  final TextEditingController emailEditingController = TextEditingController();

  final TextEditingController passwordEditingController =
      TextEditingController();

  final TextEditingController confirmPasswordEditingController =
      TextEditingController();

  RxBool checkedValue = false.obs;
  RxBool checkboxValue = false.obs;

  RxBool isSigningUp = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {}

  Future<void> signUp() async {
    isSigningUp.value = true;
    if (registrationFormKey.currentState!.validate()) {}
    isSigningUp.value = false;
  }
}
