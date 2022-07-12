import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class FailureMessage extends Failure {
  final String msg;

  const FailureMessage(this.msg);

  factory FailureMessage.fromException(e) {
    try {
      if (e is DioError) {
        'error from server   ${e.response?.data}'.log;
        if (e.response?.statusCode == 502 || e.response?.statusCode == 500) {
          return const FailureMessage(LocaleKeys.some_thing_wrong);
        }
        final error = e.response?.data['error']['details']['message'];
        if (error is String) {
          return FailureMessage(error);
        } else if (error is List<String>) {
          return FailureMessage(error.first);
        }
      }
    } catch (_) {}
'error from server $e'.log;
    return const FailureMessage(
        'Error! An error occurred. Please try again later');
  }

  @override
  List<Object?> get props => [msg];

  @override
  String toString() => msg;
}
