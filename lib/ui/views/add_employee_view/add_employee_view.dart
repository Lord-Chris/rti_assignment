import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../shared/components/_components.dart';
import '../../shared/constants/app_assets.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/spacing.dart';
import 'add_employee_viewmodel.dart';

class AddEmployeeView extends StatelessWidget {
  const AddEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddEmployeeViewModel>.nonReactive(
      viewModelBuilder: () => AddEmployeeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Add Employee Details'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: REdgeInsets.fromLTRB(16, 24, 16, 24),
                  children: [
                    AppTextField(
                      prefix: SvgPicture.asset(AppAssets.person),
                      label: 'Employee name',
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                    ),
                    Spacing.vertMedium(),
                    AppTextField(
                      prefix: SvgPicture.asset(AppAssets.work),
                      label: 'Select role',
                      readOnly: true,
                      onTap: () {},
                    ),
                    Spacing.vertMedium(),
                    Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                            prefix: SvgPicture.asset(AppAssets.event),
                            label: 'Select role',
                            readOnly: true,
                            onTap: () {},
                          ),
                        ),
                        Spacing.horizRegular(),
                        SvgPicture.asset(AppAssets.arrowRight),
                        Spacing.horizRegular(),
                        Expanded(
                          child: AppTextField(
                            prefix: SvgPicture.asset(AppAssets.event),
                            label: 'No date',
                            readOnly: true,
                            onTap: () {},
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                height: 2,
                thickness: 2,
              ),
              Padding(
                padding: REdgeInsets.fromLTRB(16, 0, 16, 12),
                child: ButtonBar(
                  children: [
                    AppButton(
                      label: 'Cancel',
                      buttonColor: AppColors.lightBlue,
                      labelColor: AppColors.blue,
                      onTap: viewModel.onCancelTap,
                    ),
                    AppButton(
                      label: 'Save',
                      onTap: viewModel.onSaveTap,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
