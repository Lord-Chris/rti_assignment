import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/add_employee_view/add_employee_view.dart';
import '../ui/views/employees_list_view/employees_list_view.dart';

/// Run "flutter pub run build_runner build --delete-conflicting-outputs"
/// Run "flutter pub run build_runner watch --delete-conflicting-outputs"

@StackedApp(
  routes: [
    AdaptiveRoute(page: EmployeesListView, initial: true),
    AdaptiveRoute(page: AddEmployeeView),
    // AdaptiveRoute(page: AddEmployeeView),
    // AdaptiveRoute(page: AddEmployeeView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class AppSetup {}
