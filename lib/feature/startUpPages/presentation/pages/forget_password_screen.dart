import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/core/utils/design_utils.dart';
import 'package:interactive/core/widgets/core_flat_button.dart';
import 'package:interactive/core/widgets/core_textField.dart';
import 'package:interactive/feature/startUpPages/presentation/controller/forget_password_controller.dart';
import 'package:interactive/feature/startUpPages/presentation/widgets/going_back_app_bar.dart';

class ForgetPasswordScreen extends GetWidget<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return SizedBox(
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
                  const GoingBackAppBar(
                    title: 'Forget Password',
                  ),
                  const Spacer(),
                 Obx(() =>  Form(
                   key: controller.forgetPasswordFormKey,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       CoreTextField(
                         labelText: 'E-mail address',
                         readOnly: controller.isSigningUp.value,
                         textInputAction: TextInputAction.done,
                         keyboardType: TextInputType.emailAddress,
                         controller: controller.emailEditingController,
                         validator: AuthValidator.emailValidator,
                       ),
                       const SizedBox(height: 20.0),
                       CoreFlatButton(
                         text: 'Forget Password'.toUpperCase(),
                         isGradientBg: true,
                         onPressed: controller.resetPassword,
                         isLoading: controller.isSigningUp.value,
                       ).paddingSymmetric(horizontal: 17),
                     ],
                   ).paddingAll(20),
                 ),),
                  const Spacer(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
