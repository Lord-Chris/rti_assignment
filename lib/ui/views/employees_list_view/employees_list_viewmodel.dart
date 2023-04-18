import 'package:stacked/stacked.dart';

import '../../../app/_app.dart';

class EmployeesListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final employees = [];

  void addEmployee() {
    _navigationService.navigateTo(Routes.addEmployeeView);
  }
}
