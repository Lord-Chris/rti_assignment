import '../../app/_app.dart';
import '../../core/models/employee_model.dart';
import '../local_storage_service/i_local_storage_service.dart';
import 'i_employee_service.dart';

class EmployeeService extends IEmployeeService {
  static const employeesKey = 'employees-key';
  final _localStorageService = locator<ILocalStorageService>();
  @override
  void addEmployee(EmployeeModel employee) {
    final employees = this.employees;
    employees.add(employee);
    _localStorageService.write(
      employeesKey,
      data: employees.map((e) => e.toMap()).toList(),
    );
  }

  @override
  void deleteEmployee(EmployeeModel employee) {
    final employees = this.employees;
    employees.remove(employee);
    _localStorageService.write(
      employeesKey,
      data: employees.map((e) => e.toMap()).toList(),
    );
  }

  @override
  List<EmployeeModel> get employees {
    final res =
        _localStorageService.read<List>(employeesKey, def: []);
    return (res)
        .map((e) => EmployeeModel.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  @override
  void updateEmployee(EmployeeModel employee) {
    final employees = this.employees;
    final index = employees.indexWhere((e) => e.id == employee.id);
    employees[index] = employee;
    _localStorageService.write(
      employeesKey,
      data: employees.map((e) => e.toMap()).toList(),
    );
  }
}
