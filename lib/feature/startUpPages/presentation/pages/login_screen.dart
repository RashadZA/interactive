import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/core/Utils/design_utils.dart';
import 'package:interactive/core/routes/app_pages.dart';
import 'package:interactive/core/widgets/core_flat_button.dart';
import 'package:interactive/core/widgets/core_textField.dart';
import 'package:interactive/feature/startUpPages/presentation/controller/login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Column(
              children: [
                SizedBox(
                  height: Get.height * 0.2,
                ),
                CircleAvatar(
                  radius: orientation == Orientation.landscape ? 40 : 60,
                  backgroundColor: AppColors.white,
                  child: Icon(
                    Icons.flutter_dash_outlined,
                    color: AppColors.primaryColor,
                    size: orientation == Orientation.landscape ? 60 : 100,
                  ),
                ),
                SizedBox(
                  height: orientation == Orientation.landscape ? 5 : 10,
                ),
                Obx(
                  () => Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CoreTextField(
                          labelText: 'Email',
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          validator: AuthValidator.emailValidator,
                          prefixIcon: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CoreTextField(
                          labelText: 'Password',
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          controller: controller.passwordController,
                          validator: AuthValidator.passwordValidator,
                          prefixIcon: Icons.password_outlined,
                          obscureText: controller.obscureText.value,
                          suffixIcon: IconButton(
                            icon: Icon(
                              !controller.obscureText.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: () =>
                                controller.changePasswordVisibilityStatus(
                                    status: controller.obscureText.value),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Forget Password',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed(Routes.forgetPassword);
                                    },
                                  style: AppTextTheme.text12.copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.end),
                        const SizedBox(
                          height: 10,
                        ),
                        CoreFlatButton(
                          text: 'Sign In'.toUpperCase(),
                          isGradientBg: true,
                          onPressed: controller.signIn,
                          isLoading: controller.isSigning.value,
                        ).paddingSymmetric(horizontal: 17),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: AppTextTheme.text18,
                            ),
                            TextSpan(
                              text: 'Sign Up',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(Routes.registration);
                                },
                              style: AppTextTheme.text22.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ])),
                        ),
                      ],
                    ),
                  ).defaultContainer(),
                ),
              ],
            ).paddingAll(20);
          },
        ),
      ),
    );
  }
}
