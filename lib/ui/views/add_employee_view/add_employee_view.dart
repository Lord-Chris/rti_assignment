import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../shared/bottom_sheets/role_list_sheet.dart';
import '../../shared/components/_components.dart';
import '../../shared/constants/app_assets.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/spacing.dart';
import '../../shared/dialogs/date_selector_dialog.dart';
import 'add_employee_viewmodel.dart';

class AddEmployeeView extends HookWidget {
  const AddEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final roleController = useTextEditingController();
    final startController = useTextEditingController(text: 'Today');
    final endController = useTextEditingController();
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
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                    ),
                    Spacing.vertMedium(),
                    AppTextField(
                      prefix: SvgPicture.asset(AppAssets.work),
                      label: 'Select role',
                      controller: roleController,
                      readOnly: true,
                      onTap: () async {
                        final res = await showModalBottomSheet(
                          context: context,
                          builder: (context) => const RoleListSheet(),
                        );
                        if (res == null) return;
                        roleController.text = res;
                      },
                    ),
                    Spacing.vertMedium(),
                    Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                            prefix: SvgPicture.asset(AppAssets.event),
                            label: 'Select role',
                            readOnly: true,
                            controller: startController,
                            onTap: () async {
                              final res = await showDialog(
                                context: context,
                                builder: (context) =>
                                    const DateSelectorDialog(),
                              );
                              if (res == null) return;
                              startController.text =
                                  DateFormat('d MMM yyyy').format(res);
                            },
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
                            controller: endController,
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
