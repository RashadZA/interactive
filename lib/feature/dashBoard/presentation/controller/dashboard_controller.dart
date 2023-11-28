import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:interactive/core/routes/app_pages.dart';
import 'package:interactive/feature/dashBoard/model/course_list_model.dart';
import 'package:interactive/feature/startUpPages/data/user_data.dart';

class DashBoardController extends GetxController {
  RxList<CourseListModel> courseList = <CourseListModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isContinueCourseButtonLoading = false.obs;
  RxBool isCourseButtonLoading = false.obs;
  CollectionReference coursesCollection =
      FirebaseFirestore.instance.collection('courses');
  RxList allData = [].obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isSignOut = false.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    isLoading.value = true;
    QuerySnapshot querySnapshot = await coursesCollection.get();
    allData.value = querySnapshot.docs.map((doc) => doc.data()).toList();
    allData.value = allData[0]['courses'];

    courseList.value =
        allData.map((course) => CourseListModel.fromMap(course)).toList();
    isLoading.value = false;
    update();
  }

  Future<void> continueCourseButtonOnTapMethod(List? modules) async {
    isContinueCourseButtonLoading.value = true;
    Get.toNamed(Routes.videoPlayer,arguments: modules);
    isContinueCourseButtonLoading.value = false;
    update();
  }

  Future<void> signOut() async {
    isSignOut.value = true;
    try {
      List user = await UserDataFromDatabase().getUserDetails();
      update();
      await UserDataFromDatabase().updateUserSignINStatusData(userEmail: "${user.first['email']}", signInStatus: "No");
      await _auth.signOut();
    } catch (e) {
      debugPrint("Error signing out: $e");
    }
    Get.offAllNamed(Routes.login);
    isSignOut.value = false;
    update();
  }
}
