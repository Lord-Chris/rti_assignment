import 'dart:convert';

import 'package:intl/intl.dart';

import '../enums/role_type_enum.dart';

class EmployeeModel {
  final String id;
  final String name;
  final RoleTypeEnum role;
  final DateTime startDate;
  final DateTime? endDate;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.role,
    required this.startDate,
    this.endDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'role': role.name,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      role: RoleTypeEnum.fromName(map['role']),
      startDate: DateTime.parse(map['start_date']),
      endDate: map['end_date'] != null ? DateTime.parse(map['end_date']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source));

  EmployeeModel copyWith({
    String? name,
    RoleTypeEnum? role,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return EmployeeModel(
      id: id,
      name: name ?? this.name,
      role: role ?? this.role,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  String get startDateParse => DateFormat('d MMM yyyy').format(startDate);
  String? get endDateParse =>
      endDate == null ? null : DateFormat('d MMM yyyy').format(endDate!);
}
