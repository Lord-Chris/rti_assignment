import 'package:stacked/stacked.dart';

import '../../../app/_app.dart';
import '../../../core/models/employee_model.dart';

class EmployeesListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final employees = <EmployeeModel>[];

  Future<void> addEmployee() async {
    final res = await _navigationService.navigateTo(Routes.addEmployeeView);
    if (res != null) employees.add(res);
    notifyListeners();
  }

  void deleteEmployee(EmployeeModel employee) {}

  List<EmployeeModel> get currentEmplyees =>
      employees.where((employee) => employee.endDate == null).toList();
  List<EmployeeModel> get previousEmplyees =>
      employees.where((employee) => employee.endDate != null).toList();
}
