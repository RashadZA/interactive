import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:interactive/core/routes/app_pages.dart';
import 'package:interactive/feature/dashBoard/data/course_data.dart';
import 'package:interactive/feature/dashBoard/model/course_list_model.dart';

class DashBoardController extends GetxController {
  RxList<CourseListModel> courseList = <CourseListModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isContinueCourseButtonLoading = false.obs;
  RxBool isCourseButtonLoading = false.obs;
  CollectionReference coursesCollection =
      FirebaseFirestore.instance.collection('courses');
  RxList allData = [].obs;

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
    print("Course data: $allData");

    courseList.value =
        allData.map((course) => CourseListModel.fromMap(course)).toList();
    // courseList.value = CourseList().courseList.map((courseMap) => CourseListModel.fromMap(courseMap)).toList();
    isLoading.value = false;
    update();
  }

  Future<void> continueCourseButtonOnTapMethod(List? modules) async {
    isContinueCourseButtonLoading.value = true;
    print("Modules: $modules");
    Get.toNamed(Routes.videoPlayer,arguments: modules);
    isContinueCourseButtonLoading.value = false;
    update();
  }
}
