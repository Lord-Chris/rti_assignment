import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

import '../../../app/_app.dart';
import '../../../core/enums/role_type_enum.dart';
import '../../../core/models/employee_model.dart';

class AddEmployeeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

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
    final data = EmployeeModel(
      id: id ?? const Uuid().v4(),
      name: name,
      role: RoleTypeEnum.fromName(role),
      startDate: start ?? DateTime.now(),
      endDate: end,
    );
    _navigationService.back(result: data);
  }
}
