import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

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
                return Container(
                  color: AppColors.secBackground,
                  child: Center(
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
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        );
      },
    );
  }
}
