import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:interactive/core/utils/design_utils.dart';

class LoginAuth {
  // firebase
  final auth = FirebaseAuth.instance;
  RxString errorMessage = "".obs;

  Future<void> signIn({required String email, required String password}) async {
    try {
      UserCredential login = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print("UID : ${login.user?.uid}");
      print("log : $login");
      print(
          "FirebaseAuth.instance.currentUser!.emailVerified : ${FirebaseAuth.instance.currentUser!.emailVerified}");
      if (FirebaseAuth.instance.currentUser!.emailVerified == false) {
        "Please verify your email by clicking the link we send you"
            .infoSnackBar();
      } else {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(login.user?.uid)
            .get()
            .then((value) async {
          print("Login Data: ${value.data()}");
          // await GSServices.setUser(user: UserModel.fromMap(value.data()));
        });
        // await GSServices.setUser(user: user);
        "Sign In Successful".successSnackBar();
        // Get.offAllNamed(Routes.dashboard);
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
