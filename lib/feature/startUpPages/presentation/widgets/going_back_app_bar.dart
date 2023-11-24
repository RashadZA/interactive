import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive/core/utils/design_utils.dart';

class GoingBackAppBar extends StatelessWidget {
  final String title;
  const GoingBackAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.primaryColor,
                ),
              ),
              const Spacer(),
              Text(
                title,
                style: AppTextTheme.text24.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
