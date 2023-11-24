import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/core/Utils/design_utils.dart';
import 'package:interactive/core/routes/app_pages.dart';
import 'package:interactive/core/widgets/core_flat_button.dart';
import 'package:interactive/feature/dashBoard/model/course_list_model.dart';

class DashBoardCourseCard extends StatelessWidget {
  final CourseListModel courseListModel;
  final Function onTap;
  DashBoardCourseCard(
      {Key? key,
        required this.courseListModel,
        required this.onTap,
      })
      : super(key: key);
  final double width = Get.width - (defaultAllPadding * 4);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: AppColors.primaryColor,
          onTap: () => onTap(),
          child: Container(
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
                  "${courseListModel.courseDescription}",
                  style: AppTextTheme.text16.copyWith(
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.visible),
                ),
                const SizedBox(
                  height: 10,
                ),
                CoreFlatButton(
                  text: "Continue Course",
                  isGradientBg: true,
                  onPressed: () => Get.toNamed(Routes.videoPlayer),
                ).paddingSymmetric(horizontal: 17),
              ],
            ),
          ).defaultContainer(),
        ),
        const SizedBox(
          height: defaultAllPadding,
        ),
      ],
    );
  }
}