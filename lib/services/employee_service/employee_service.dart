import '../../app/_app.dart';
import '../../core/models/employee_deletion_model.dart';
import '../../core/models/employee_model.dart';
import '../local_storage_service/i_local_storage_service.dart';
import 'i_employee_service.dart';

class EmployeeService extends IEmployeeService {
  static const employeesKey = 'employees-key';
  final _localStorageService = locator<ILocalStorageService>();

  final _recoverList = <EmployeeDeletionModel>[];

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

    /// Get the index and add to the temporary recovery list
    final index = employees.indexWhere((e) => e.id == employee.id);
    _recoverList.add(EmployeeDeletionModel(index: index, employee: employee));

    /// Proceed to delete
    employees.remove(employee);
    _localStorageService.write(
      employeesKey,
      data: employees.map((e) => e.toMap()).toList(),
    );

    /// Remove from recovery list after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      _recoverList.remove(employee);
    });
  }

  @override
  List<EmployeeModel> get employees {
    final res = _localStorageService.read<List>(employeesKey, def: []) as List;
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

  @override
  void recoverEmployee(EmployeeModel employee) {
    /// Get [EmployeeDeletionModel] data
    final index = _recoverList
        .indexWhere((element) => element.employee.id == employee.id);

    /// Stop if it does not exist
    if (index < 0) return;

    final employees = this.employees;
    employees.insert(_recoverList[index].index, employee);
    _localStorageService.write(
      employeesKey,
      data: employees.map((e) => e.toMap()).toList(),
    );
  }
}
