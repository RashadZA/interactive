import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/core/routes/app_pages.dart';
import 'package:interactive/core/utils/design_utils.dart';
import 'package:interactive/feature/startUpPages/service/registration_auth.dart';

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
    if (registrationFormKey.currentState!.validate()) {
      if (passwordEditingController.text !=
          confirmPasswordEditingController.text) {
        "Password and Confirm Password didn't match".errorSnackBar();
      } else {
        String message = await RegistrationAuth().registrationInFirebase(
          userEmail: emailEditingController.text,
          userPassword: passwordEditingController.text,
          userFirstName: firstNameEditingController.text,
          userSecondName: secondNameEditingController.text,
          userMobile: mobileNumberEditingController.text,
        );
        if (message != success) {
          message.errorSnackBar();
        } else {
          "Account created successfully...".successSnackBar();
          Get.offAllNamed(Routes.login);
        }
      }
    }
    isSigningUp.value = false;
  }
}
