import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '_constants.dart';

class AppTheme {
  static final theme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: AppColors.blue,
    fontFamily: AppTextStyles.roboto,
    scaffoldBackgroundColor: AppColors.white,
    useMaterial3: true,
    backgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0.5,
      iconTheme: IconThemeData(size: 17.sp),
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      tilePadding: EdgeInsets.symmetric(vertical: 4),
    ),
  );
}
