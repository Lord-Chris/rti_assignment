import 'package:stacked/stacked.dart';

import '../../../app/_app.dart';
import '../../../core/models/employee_model.dart';
import '../../../services/employee_service/i_employee_service.dart';

class EmployeesListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _employeeService = locator<IEmployeeService>();

  Future<void> addEmployee() async {
    final res = await _navigationService.navigateTo(Routes.addEmployeeView);
    if (res == null) return;
    notifyListeners();
  }

  Future<void> viewEmployee(EmployeeModel employee) async {
    final res = await _navigationService.navigateTo(
      Routes.addEmployeeView,
      arguments: AddEmployeeViewArguments(employee: employee),
    );
    if (res == null) return;
    notifyListeners();
  }

  void deleteEmployee(EmployeeModel employee) {
    _employeeService.deleteEmployee(employee);
    notifyListeners();
  }

  List<EmployeeModel> get employees => _employeeService.employees;
  List<EmployeeModel> get currentEmplyees =>
      employees.where((employee) => employee.endDate == null).toList();
  List<EmployeeModel> get previousEmplyees =>
      employees.where((employee) => employee.endDate != null).toList();
}
