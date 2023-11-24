import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/core/Utils/design_utils.dart';
import 'package:interactive/core/widgets/core_flat_button.dart';
import 'package:interactive/core/widgets/core_textField.dart';
import 'package:interactive/feature/startUpPages/presentation/controller/registration_controller.dart';
import 'package:interactive/feature/startUpPages/presentation/widgets/going_back_app_bar.dart';

class RegistrationScreen extends GetWidget<RegistrationController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Column(
              children: [
                const GoingBackAppBar(
                  title: 'Registration',
                ),
                const SizedBox(height: 40),
                Form(
                  key: controller.registrationFormKey,
                  child: Column(
                    children: [
                      CoreTextField(
                        labelText: 'First Name',
                        readOnly: controller.isSigningUp.value,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.firstNameEditingController,
                        validator: AuthValidator.nameValidator,
                      ),
                      const SizedBox(height: 30),
                      CoreTextField(
                        labelText: 'Last Name',
                        readOnly: controller.isSigningUp.value,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.secondNameEditingController,
                        validator: AuthValidator.nameValidator,
                      ),
                      const SizedBox(height: 20.0),
                      CoreTextField(
                        labelText: 'Mobile Number',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        controller: controller.mobileNumberEditingController,
                        validator: AuthValidator.phoneValidator,
                      ),
                      const SizedBox(height: 20.0),
                      CoreTextField(
                        labelText: 'E-mail address',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailEditingController,
                        validator: AuthValidator.emailValidator,
                        prefixIcon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 20.0),
                      CoreTextField(
                        labelText: 'Password',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        controller: controller.passwordEditingController,
                        validator: AuthValidator.passwordValidator,
                        prefixIcon: Icons.password_outlined,
                      ),
                      const SizedBox(height: 20.0),
                      CoreTextField(
                        labelText: 'Confirm Password',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        controller: controller.confirmPasswordEditingController,
                        validator: AuthValidator.passwordValidator,
                        prefixIcon: Icons.password_outlined,
                      ),
                      const SizedBox(height: 30.0),
                      Obx(() => CoreFlatButton(
                            text: 'Register'.toUpperCase(),
                            textColor: AppColors.white,
                            isGradientBg: true,
                            onPressed: controller.signUp,
                            isLoading: controller.isSigningUp.value,
                          ).paddingSymmetric(horizontal: 17)),
                    ],
                  ).paddingAll(20),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
