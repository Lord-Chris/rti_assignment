import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String _message;
  final String? extraData;

  const Failure({
    String? message,
    this.extraData,
  }) : _message = message ?? 'Something went wrong';

  String get message => _message;

  @override
  List<Object?> get props => [_message, extraData];
}

class ApiFailure extends Failure {
  final int? statusCode;

  const ApiFailure({
    required this.statusCode,
    super.message,
    super.extraData,
  });

  @override
  List<Object?> get props => [statusCode, message, extraData];
}
