import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/employees_list_view/employees_list_view.dart';

/// Run "flutter pub run build_runner build --delete-conflicting-outputs"
/// Run "flutter pub run build_runner watch --delete-conflicting-outputs"

@StackedApp(
  routes: [
    AdaptiveRoute(page: EmployeesListView, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class AppSetup {}
