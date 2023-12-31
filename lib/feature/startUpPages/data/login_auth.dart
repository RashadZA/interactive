import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:interactive/core/routes/app_pages.dart';
import 'package:interactive/core/utils/design_utils.dart';
import 'package:interactive/core/widgets/user_model.dart';
import 'package:interactive/feature/startUpPages/data/user_data.dart';

class LoginAuth {
  // firebase
  final auth = FirebaseAuth.instance;
  RxString errorMessage = "".obs;

  Future<void> signIn({required String email, required String password}) async {
    try {
      UserCredential login = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (FirebaseAuth.instance.currentUser!.emailVerified == false) {
        "Please verify your email by clicking the link we send you"
            .infoSnackBar();
        login.user?.sendEmailVerification();
      } else {
        DocumentSnapshot signInUser = await FirebaseFirestore.instance
            .collection("users")
            .doc(login.user?.uid)
            .get();
        debugPrint("Login Button is pressed");
        await UserDataFromDatabase(). deleteUsersListTable();
        await UserDataFromDatabase().insertUserData(user: UserModel.fromMap(signInUser.data() as Map<String, dynamic>),signInStatus: "Yes");
        await UserDataFromDatabase().getUserDetails();
        "Sign In Successful".successSnackBar();
        Get.offAllNamed(Routes.dashBoard);
      }
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage.value = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage.value = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage.value = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage.value = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage.value = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage.value =
              "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage.value = "An undefined Error happened.";
      }
      errorMessage.value.errorSnackBar();
      if (kDebugMode) {
        print(error.code);
      }
    }
  }
}
