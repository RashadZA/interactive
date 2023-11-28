import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/core/utils/design_utils.dart';
import 'package:interactive/feature/dashBoard/model/course_list_model.dart';
import 'package:interactive/feature/dashBoard/presentation/controller/dashboard_controller.dart';
import 'package:interactive/feature/dashBoard/presentation/widgets/dashboard_course_card.dart';

class DashBoard extends GetWidget<DashBoardController> {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "DashBoard",
          style: AppTextTheme.text22.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation){
          return Obx(() => controller.isLoading.value == true
              ? Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: defaultLoader(color: AppColors.primaryColor),
              ).defaultContainer())
              : CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    for (CourseListModel course in controller.courseList) ...[
                      DashBoardCourseCard(courseListModel: course,),
                    ],
                  ],
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}
