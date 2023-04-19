import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/enums/role_type_enum.dart';
import '../constants/app_textstyles.dart';

class RoleListSheet extends StatelessWidget {
  const RoleListSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: RoleTypeEnum.values.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final role = RoleTypeEnum.values[index];
          return InkWell(
            onTap: () => Navigator.pop(context, role.name),
            child: Padding(
              padding: REdgeInsets.all(16),
              child: Center(
                child: Text(
                  role.name,
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
