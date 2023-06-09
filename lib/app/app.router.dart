// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:rti_assignment/core/models/employee_model.dart' as _i5;
import 'package:rti_assignment/ui/views/add_employee_view/add_employee_view.dart'
    as _i3;
import 'package:rti_assignment/ui/views/employees_list_view/employees_list_view.dart'
    as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const employeesListView = '/';

  static const addEmployeeView = '/add-employee-view';

  static const all = <String>{
    employeesListView,
    addEmployeeView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.employeesListView,
      page: _i2.EmployeesListView,
    ),
    _i1.RouteDef(
      Routes.addEmployeeView,
      page: _i3.AddEmployeeView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.EmployeesListView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.EmployeesListView(),
        settings: data,
      );
    },
    _i3.AddEmployeeView: (data) {
      final args = data.getArgs<AddEmployeeViewArguments>(
        orElse: () => const AddEmployeeViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i3.AddEmployeeView(key: args.key, employee: args.employee),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AddEmployeeViewArguments {
  const AddEmployeeViewArguments({
    this.key,
    this.employee,
  });

  final _i4.Key? key;

  final _i5.EmployeeModel? employee;

  @override
  String toString() {
    return '{"key": "$key", "employee": "$employee"}';
  }

  @override
  bool operator ==(covariant AddEmployeeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.employee == employee;
  }

  @override
  int get hashCode {
    return key.hashCode ^ employee.hashCode;
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToEmployeesListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.employeesListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddEmployeeView({
    _i4.Key? key,
    _i5.EmployeeModel? employee,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addEmployeeView,
        arguments: AddEmployeeViewArguments(key: key, employee: employee),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEmployeesListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.employeesListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddEmployeeView({
    _i4.Key? key,
    _i5.EmployeeModel? employee,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addEmployeeView,
        arguments: AddEmployeeViewArguments(key: key, employee: employee),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
