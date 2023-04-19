// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/employee_service/employee_service.dart';
import '../services/employee_service/i_employee_service.dart';
import '../services/local_storage_service/i_local_storage_service.dart';
import '../services/local_storage_service/local_storage_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  final localStorageService = await LocalStorageService.init();
  locator.registerSingleton<ILocalStorageService>(localStorageService);

  locator.registerLazySingleton<IEmployeeService>(() => EmployeeService());
}
