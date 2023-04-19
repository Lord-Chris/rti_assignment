import 'package:flutter/material.dart';

extension ValidatorExtension on BuildContext {
  String? validateNotEmpty(String? value) =>
      (value ?? '').isEmpty ? 'Field cannot be empty' : null;

  String? validateFullName(String? value) =>
      value != null && value.split(' ').length < 2
          ? 'Enter a valid Full Name'
          : null;
}
