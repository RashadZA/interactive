import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:interactive/core/routes/app_pages.dart';
import 'package:interactive/core/utils/design_utils.dart';

class ForgetPasswordAuth {
  final auth = FirebaseAuth.instance;

  Future<void> forgetPassword({
    required String userEmail,
  }) async {
    try {
      dynamic pass = await auth
          .sendPasswordResetEmail(email: userEmail)
          .then((value) async {
        Get.offAllNamed(Routes.login);
        "We have sent you a mail for reset password...".successSnackBar();
      }).catchError((error) {
        error.toString().errorSnackBar();
      });
      "$pass".successSnackBar();
    } catch (e) {
      e.toString().errorSnackBar();
    }
  }
}
