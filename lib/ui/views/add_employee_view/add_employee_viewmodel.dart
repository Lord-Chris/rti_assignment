import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

import '../../../app/_app.dart';
import '../../../core/enums/role_type_enum.dart';
import '../../../core/models/employee_model.dart';
import '../../../core/models/failure.dart';
import '../../../services/employee_service/i_employee_service.dart';

class AddEmployeeViewModel extends BaseViewModel {
  final _logger = getLogger('AddEmployeeViewModel');
  final _navigationService = locator<NavigationService>();
  final _employeeService = locator<IEmployeeService>();

  String? id;
  DateTime? start;
  DateTime? end;

  void init(EmployeeModel employee) {
    id = employee.id;
    start = employee.startDate;
    end = employee.endDate;
  }

  void onCancelTap() {
    _navigationService.back();
  }

  void onSaveTap(String name, String role) {
    try {
      final data = EmployeeModel(
        id: id ?? const Uuid().v4(),
        name: name,
        role: RoleTypeEnum.fromName(role),
        startDate: start ?? DateTime.now(),
        endDate: end,
      );
      if (id == null) {
        _employeeService.addEmployee(data);
      } else {
        _employeeService.updateEmployee(data);
      }
      _navigationService.back(result: data);
    } on Failure catch (e) {
      _logger.e(e);
    }
  }
}
