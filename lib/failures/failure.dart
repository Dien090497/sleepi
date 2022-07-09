import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:slee_fi/common/extensions/string_x.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class FailureMessage extends Failure {
  final String msg;

  const FailureMessage(this.msg);

  factory FailureMessage.fromException(Exception e) {
    try {
      if (e is DioError) {
        if (e.response?.statusCode == 502 || e.response?.statusCode == 500) {
          return const FailureMessage('Some thing wrong');
        }
        'error is   ${e.response?.data}'.log;
        final error = e.response?.data['error']['details']['message'];
        if (error is String) {
          return FailureMessage(error);
        } else if (error is List<String>) {
          return FailureMessage(error.first);
        }
      }
    } catch (_) {}
    'error is $e'.log;

    return const FailureMessage(
        'Error! An error occurred. Please try again later');
  }

  @override
  List<Object?> get props => [msg];

  @override
  String toString() => msg;
}
