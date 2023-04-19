import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rti_assignment/app/_app.dart';
import 'package:rti_assignment/core/_core.dart';
import 'package:rti_assignment/services/employee_service/employee_service.dart';
import 'package:rti_assignment/services/local_storage_service/i_local_storage_service.dart';

import 'mock_helper_test.mocks.dart';

final employee1 = EmployeeModel(
  id: '1',
  name: 'John',
  role: RoleTypeEnum.flutterDeveloper,
  startDate: DateTime(2022, 1, 1),
  endDate: DateTime(2022, 12, 31),
);

final employee2 = EmployeeModel(
  id: '2',
  name: 'Jane',
  role: RoleTypeEnum.productDesigner,
  startDate: DateTime(2022, 2, 1),
);

final employee3 = EmployeeModel(
  id: '3',
  name: 'Bob',
  role: RoleTypeEnum.qaTester,
  startDate: DateTime(2022, 3, 1),
);

final employee4 = EmployeeModel(
  id: '4',
  name: 'Alice',
  role: RoleTypeEnum.productOwner,
  startDate: DateTime(2022, 4, 1),
  endDate: DateTime(2022, 6, 30),
);

final employee5 = EmployeeModel(
  id: '5',
  name: 'Tom',
  role: RoleTypeEnum.flutterDeveloper,
  startDate: DateTime(2022, 5, 1),
);

final mainEmployeeList = [
  employee1,
  employee2,
  employee3,
  employee4,
  employee5
];

void main() {
  group('Employee Service - ', () {
    setUp(() {
      // // Reset all
      locator.reset();
      locator.allowReassignment = true;
    });

    test('Check that initial employee list is 5', () {
      final mockStorageService = MockILocalStorageService();
      when(mockStorageService.read<List>(EmployeeService.employeesKey, def: []))
          .thenReturn([]);

      locator.registerSingleton<ILocalStorageService>(mockStorageService);

      var employeeService = EmployeeService();
      expect(employeeService.employees.length, 0);
    });

    test('addEmployee should write to local storage', () {
      // set up the mock localStorageService
      final mockStorageService = MockILocalStorageService();
      when(mockStorageService.read<List>(EmployeeService.employeesKey, def: []))
          .thenReturn([]);
      when(mockStorageService.write(
        EmployeeService.employeesKey,
        data: anyNamed('data'),
      )).thenAnswer((_) async {});

      locator.registerSingleton<ILocalStorageService>(mockStorageService);

      var employeeService = EmployeeService();
      employeeService.addEmployee(employee1);

      // verify that the local storage service was called with the correct arguments
      verify(mockStorageService.write(
        EmployeeService.employeesKey,
        data: [employee1.toMap()],
      ));
    });

    test('deleteEmployee should delete from local storage', () {
      final employees = [employee1, employee2, employee3, employee4, employee5];
      // Set localStorageService up
      final mockStorageService = MockILocalStorageService();

      when(mockStorageService.write(
        EmployeeService.employeesKey,
        data: anyNamed('data'),
      )).thenAnswer((_) async {});

      when(mockStorageService.read(EmployeeService.employeesKey, def: []))
          .thenReturn(
              (employees..remove(employee1)).map((e) => e.toMap()).toList());
      locator.registerSingleton<ILocalStorageService>(mockStorageService);

      // Employee Service
      final employeeService = EmployeeService();

      /// Actionx
      employeeService.deleteEmployee(employee1);

      /// Verify
      expect(employeeService.employees.length, mainEmployeeList.length - 1);
      expect(employeeService.employees.length, employees.length);

      verify(mockStorageService.write(
        EmployeeService.employeesKey,
        data: employees.map((e) => e.toMap()).toList(),
      ));
    });
  });
}
