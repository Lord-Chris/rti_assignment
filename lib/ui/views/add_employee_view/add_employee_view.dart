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

final _formKey = GlobalKey<FormState>();

class AddEmployeeView extends HookWidget {
  final EmployeeModel? employee;
  const AddEmployeeView({
    super.key,
    this.employee,
  });

  // String getStartDate(DateTime date) {
  //   if (date.compareExactDay(DateTime.now())) return 'Today';
  //   return date
  // }

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController(text: employee?.name);
    final roleController = useTextEditingController(text: employee?.role.name);
    final startController =
        useTextEditingController(text: employee?.startDateParse ?? 'Today');
    final endController =
        useTextEditingController(text: employee?.endDateParse);

    ///
    return ViewModelBuilder<AddEmployeeViewModel>.nonReactive(
      viewModelBuilder: () => AddEmployeeViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(employee),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Add Employee Details'),
          ),
          body: Form(
            key: _formKey,
            child: Column(
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
                        validator: context.validateFullName,
                      ),
                      Spacing.vertMedium(),
                      AppTextField(
                        prefix: SvgPicture.asset(AppAssets.work),
                        label: 'Select role',
                        hint: 'Select role',
                        controller: roleController,
                        readOnly: true,
                        validator: context.validateNotEmpty,
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
                              label: 'Today',
                              readOnly: true,
                              controller: startController,
                              validator: context.validateNotEmpty,
                              onTap: () async {
                                final res = await showDialog(
                                  context: context,
                                  builder: (context) => DateSelectorDialog(
                                    currentDate: viewModel.start,
                                    isStart: true,
                                  ),
                                );
                                if (res == null) return;
                                viewModel.start = res;
                                startController.text = (res as DateTime)
                                        .compareExactDay(DateTime.now())
                                    ? 'Today'
                                    : DateFormat('d MMM yyyy').format(res);
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
                              hint: 'No date',
                              readOnly: true,
                              controller: endController,
                              onTap: () async {
                                final res = await showDialog(
                                  context: context,
                                  builder: (context) => DateSelectorDialog(
                                    currentDate: viewModel.end,
                                    startDate: viewModel.start,
                                    isStart: false,
                                  ),
                                );
                                if (res == null) return;
                                if ((res as DateTime) == viewModel.start!) {
                                  viewModel.end = null;
                                  endController.clear();
                                } else {
                                  viewModel.end = res;
                                  endController.text =
                                      DateFormat('d MMM yyyy').format(res);
                                }
                              },
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
                        onTap: () {
                          if (!_formKey.currentState!.validate()) return;
                          viewModel.onSaveTap(
                            nameController.text,
                            roleController.text,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
