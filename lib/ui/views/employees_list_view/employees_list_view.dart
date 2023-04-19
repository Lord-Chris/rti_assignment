import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/employee_model.dart';
import '../../shared/constants/_constants.dart';
import 'employees_list_viewmodel.dart';

class EmployeesListView extends StatelessWidget {
  const EmployeesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployeesListViewModel>.reactive(
      viewModelBuilder: () => EmployeesListViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.secBackground,
          appBar: AppBar(
            title: const Text('Employee List'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: viewModel.addEmployee,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.add,
              size: 30.r,
            ),
          ),
          body: Builder(
            builder: (context) {
              if (viewModel.employees.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppAssets.noEmployees),
                      Spacing.vertTiny(),
                      Text(
                        'No employee records found',
                        style: AppTextStyles.medium18,
                      ),
                    ],
                  ),
                );
              }
              return ListView(
                children: [
                  if (viewModel.currentEmplyees.isNotEmpty)
                    Padding(
                      padding: REdgeInsets.all(16),
                      child: Text(
                        'Current employees',
                        style: AppTextStyles.medium16.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: viewModel.currentEmplyees.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final employee = viewModel.currentEmplyees[index];
                      return _EmployeeItem(employee: employee);
                    },
                  ),
                  if (viewModel.previousEmplyees.isNotEmpty)
                    Padding(
                      padding: REdgeInsets.all(16),
                      child: Text(
                        'Previous employees',
                        style: AppTextStyles.medium16.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: viewModel.previousEmplyees.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final employee = viewModel.previousEmplyees[index];
                      return _EmployeeItem(employee: employee);
                    },
                  ),
                  Padding(
                    padding:
                        REdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Text(
                      'Swipe left to delete',
                      style: AppTextStyles.regular15.copyWith(
                        color: AppColors.hintGrey,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _EmployeeItem extends ViewModelWidget<EmployeesListViewModel> {
  const _EmployeeItem({
    required this.employee,
  });

  final EmployeeModel employee;

  @override
  Widget build(BuildContext context, EmployeesListViewModel viewModel) {
    return InkWell(
      onTap: () => viewModel.viewEmployee(employee),
      child: Dismissible(
        key: Key(employee.id),
        onDismissed: (direction) => viewModel.deleteEmployee(employee),
        direction: DismissDirection.endToStart,
        background: Container(
          padding: REdgeInsets.only(right: 20),
          color: AppColors.red,
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(AppAssets.delete),
        ),
        child: Container(
          width: double.infinity,
          color: AppColors.white,
          padding: REdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                employee.name,
                style: AppTextStyles.medium16,
              ),
              const Spacing(height: 6),
              Text(
                employee.role.name,
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.hintGrey,
                ),
              ),
              const Spacing(height: 6),
              Text(
                employee.endDateParse2.isEmpty
                    ? 'From ${employee.startDateParse2}'
                    : '${employee.startDateParse2} - ${employee.endDateParse2}',
                style: AppTextStyles.regular12.copyWith(
                  color: AppColors.hintGrey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
