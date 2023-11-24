import 'package:get/get.dart';
import 'package:interactive/feature/dashBoard/data/course_data.dart';
import 'package:interactive/feature/dashBoard/model/course_list_model.dart';

class DashBoardController extends GetxController {
  RxList<CourseListModel> courseList = <CourseListModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isCourseButtonLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    init();
  }



  Future<void> init() async {
    isLoading.value = true;
    courseList.value = CourseList().courseList.map((courseMap) => CourseListModel.fromMap(courseMap)).toList();
    isLoading.value = false;
    update();
  }
}
