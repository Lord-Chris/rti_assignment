import 'package:equatable/equatable.dart';

import 'employee_model.dart';

class EmployeeDeletionModel extends Equatable {
  final int index;
  final EmployeeModel employee;

  const EmployeeDeletionModel({
    required this.index,
    required this.employee,
  });

  @override
  List<Object> get props => [index, employee];
}
