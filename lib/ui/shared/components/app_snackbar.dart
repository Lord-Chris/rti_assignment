import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/_app.dart';
import '../constants/_constants.dart';

class AppSnackbar extends StatelessWidget {
  final String label;
  final String buttonLaabel;
  final VoidCallback onButtonTap;

  const AppSnackbar({
    Key? key,
    required this.label,
    required this.buttonLaabel,
    required this.onButtonTap,
  }) : super(key: key);

  static void showDeleteSuccess(VoidCallback onButtonTap) {
    ScaffoldMessenger.of(StackedService.navigatorKey!.currentContext!)
        .showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: AppColors.textBlack,
        padding: EdgeInsets.zero,
        content: AppSnackbar(
          label: 'Employee data has been deleted',
          buttonLaabel: 'Undo',
          onButtonTap: onButtonTap,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.textBlack,
      padding: REdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: AppTextStyles.regular15.copyWith(color: AppColors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              onButtonTap();
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
            child: Text(
              buttonLaabel,
              style: AppTextStyles.regular15.copyWith(color: AppColors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
