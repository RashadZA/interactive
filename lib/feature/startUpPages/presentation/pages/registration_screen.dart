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
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.firstNameEditingController,
                        validator: AuthValidator.nameValidator,
                      ),
                      const SizedBox(height: 30),
                      CoreTextField(
                        labelText: 'Last Name',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.secondNameEditingController,
                        validator: AuthValidator.nameValidator,
                      ),
                      const SizedBox(height: 20.0),
                      CoreTextField(
                        labelText: 'Mobile Number',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
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
                      const SizedBox(height: 15.0),
                      FormField<bool>(
                        builder: (state) {
                          return Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    checkColor: AppColors.primaryColor,
                                    activeColor: AppColors.white,
                                    value: controller.checkboxValue.value,
                                    onChanged: (value) {
                                      controller.checkboxValue.value = value!;
                                      state.didChange(value);
                                    },
                                  ),
                                  Text(
                                    "I accept all terms and conditions.",
                                    style: AppTextTheme.text16.copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  state.errorText ?? '',
                                  textAlign: TextAlign.left,
                                  style: AppTextTheme.text14
                                      .copyWith(color: AppColors.redAccent),
                                ),
                              )
                            ],
                          ).paddingOnly(left: 20, right: 20);
                        },
                        validator: (value) {
                          if (!controller.checkboxValue.value) {
                            return 'You need to accept terms and conditions';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20.0),
                      Obx(() => CoreFlatButton(
                            text: 'Register'.toUpperCase(),
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
