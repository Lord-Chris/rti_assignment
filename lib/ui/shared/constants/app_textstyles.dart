import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static const roboto = 'Roboto';

  static TextStyle dynamic(
    double size, {
    Color? color,
    FontWeight? weight,
    double? height,
    double? spacing,
    FontStyle? style,
    String? fontFamily,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? roboto,
      fontSize: size.spMin,
      color: color,
      fontWeight: weight,
      height: height == null ? null : height / size,
      letterSpacing: spacing,
      fontStyle: style,
    );
  }

  // Regular

  static final regular12 = TextStyle(
    fontSize: 12.spMin,
    fontWeight: FontWeight.normal,
    height: 1.2,
  );

  static final regular14 = TextStyle(
    fontSize: 14.spMin,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );

  static final regular15 = TextStyle(
    fontSize: 15.spMin,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );

  static final regular16 = TextStyle(
    fontSize: 16.spMin,
    fontWeight: FontWeight.normal,
  );

  // Medium
  static final medium14 = TextStyle(
    fontSize: 14.spMin,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static final medium16 = TextStyle(
    fontSize: 16.spMin,
    fontWeight: FontWeight.w500,
  );

  static final medium18 = TextStyle(
    fontSize: 18.spMin,
    fontWeight: FontWeight.w500,
  );
}
