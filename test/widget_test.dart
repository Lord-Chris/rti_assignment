// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rti_assignment/app/_app.dart';
import 'package:rti_assignment/main.dart';
import 'package:rti_assignment/services/employee_service/i_employee_service.dart';

import 'mock_helper_test.mocks.dart';

void main() {
  setUp(() {
    setupLocator();
    locator.allowReassignment = true;

    final mockEmployeeService = MockIEmployeeService();
    when(mockEmployeeService.employees).thenReturn([]);
    locator.registerSingleton<IEmployeeService>(mockEmployeeService);
  });

  testWidgets('Finds Add Icon', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
