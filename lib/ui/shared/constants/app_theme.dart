import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '_constants.dart';

class AppTheme {
  static final theme = ThemeData(
    primaryColor: AppColors.blue,
    fontFamily: AppTextStyles.roboto,
    scaffoldBackgroundColor: AppColors.white,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blue,
      elevation: 0.5,
      titleTextStyle: AppTextStyles.medium18,
      centerTitle: false,
      iconTheme: IconThemeData(size: 17.sp),
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      tilePadding: EdgeInsets.symmetric(vertical: 4),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.borderGrey,
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
      background: AppColors.background,
    ),
  );
}
