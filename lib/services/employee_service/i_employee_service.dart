import '../../core/models/employee_model.dart';

abstract class IEmployeeService {
  List<EmployeeModel> get employees;

  void addEmployee(EmployeeModel employee);
  void updateEmployee(EmployeeModel employee);
  void deleteEmployee(EmployeeModel employee);
}
