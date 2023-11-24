import 'package:flutter/material.dart';
import 'package:interactive/core/utils/design_utils.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Dashboard Screen",
          style: AppTextTheme.text18,
        ),
      ),
    );
  }
}
