import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_textstyles.dart';

class RoleListSheet extends StatelessWidget {
  const RoleListSheet({super.key});

  static const roles = [
    'Product Designer',
    'Flutter Developer',
    'QA Tester',
    'Product Owner',
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: roles.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final role = roles[index];
          return InkWell(
            onTap: () => Navigator.pop(context, role),
            child: Padding(
              padding: REdgeInsets.all(16),
              child: Center(
                child: Text(
                  role,
                  style: AppTextStyles.regular16,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
