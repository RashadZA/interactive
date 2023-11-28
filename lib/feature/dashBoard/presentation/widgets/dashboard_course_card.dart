import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/core/Utils/design_utils.dart';
import 'package:interactive/core/widgets/core_flat_button.dart';
import 'package:interactive/feature/dashBoard/model/course_list_model.dart';
import 'package:interactive/feature/dashBoard/presentation/controller/dashboard_controller.dart';

class DashBoardCourseCard extends GetWidget<DashBoardController> {
  final CourseListModel courseListModel;
  DashBoardCourseCard({
    Key? key,
    required this.courseListModel,
  }) : super(key: key);
  final double width = Get.width - (defaultAllPadding * 4);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(defaultBorderRadius)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${courseListModel.courseName}",
                style: AppTextTheme.text18.copyWith(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.visible),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "List of Modules: ${courseListModel.courseModulesLength}",
                style: AppTextTheme.text18.copyWith(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.visible),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${courseListModel.courseDescription}",
                style: AppTextTheme.text16.copyWith(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.visible),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => CoreFlatButton(
                  text: "Continue Course",
                  isGradientBg: true,
                  isLoading: controller.isContinueCourseButtonLoading.value,
                  onPressed: () => controller.continueCourseButtonOnTapMethod(
                      courseListModel.courseModules),
                ).paddingSymmetric(horizontal: 17),
              ),
            ],
          ),
        ).defaultContainer(),
        const SizedBox(
          height: defaultAllPadding,
        ),
      ],
    );
  }
}
