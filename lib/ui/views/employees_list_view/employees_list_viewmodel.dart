import 'package:stacked/stacked.dart';

import '../../../app/_app.dart';
import '../../../core/_core.dart';
import '../../../services/employee_service/i_employee_service.dart';
import '../../shared/components/_components.dart';

class EmployeesListViewModel extends BaseViewModel {
  final _logger = getLogger('EmployeesListViewModel');
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
    try {
      _employeeService.deleteEmployee(employee);
      AppSnackbar.showDeleteSuccess(() => recoverEmployee(employee));
      notifyListeners();
    } on Failure catch (e) {
      _logger.e(e);
    }
  }

  void recoverEmployee(EmployeeModel employee) {
    try {
      _employeeService.recoverEmployee(employee);
      notifyListeners();
    } on Failure catch (e) {
      _logger.e(e);
    }
  }

  List<EmployeeModel> get employees => _employeeService.employees;
  List<EmployeeModel> get currentEmplyees =>
      employees.where((employee) => employee.endDate == null).toList();
  List<EmployeeModel> get previousEmplyees =>
      employees.where((employee) => employee.endDateParse2.isNotEmpty).toList();
}
