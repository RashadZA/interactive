import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interactive/core/utils/design_utils.dart';
import 'package:interactive/feature/startUpPages/model/user_model.dart';

class RegistrationAuth {
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  UserModel userModel = UserModel();
  dynamic signUp;
  Future<String> registrationInFirebase({
    required String userEmail,
    required String userPassword,
    required String userFirstName,
    required String userSecondName,
    required String userMobile,
  }) async {
    try {
      signUp = await auth.createUserWithEmailAndPassword(
          email: userEmail, password: userPassword);
    } catch (error) {
      return error.toString();
    }

    if (signUp.user!.uid != null) {
      userModel.email = signUp.user!.email;
      userModel.uid = signUp.user!.uid;
      userModel.firstName = userFirstName;
      userModel.secondName = userSecondName;
      userModel.mobileNumber = userMobile;
      userModel.signIn = true;
      await firebaseFireStore
          .collection("users")
          .doc(signUp.user!.uid)
          .set(userModel.toMap());
      return success;
    } else {
      return signUp.toString();
    }
  }
}
