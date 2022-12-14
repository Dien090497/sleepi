import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

abstract class Failure extends Equatable {
  const Failure();

  static const String notApprovalForNft = 'not_approval_for_nft';
}

class FailureMessage extends Failure {
  final String msg;

  const FailureMessage(this.msg);

  factory FailureMessage.fromException(e) {
    try {
      if (e is DioError) {
        if (e.response?.statusCode == 502 || e.response?.statusCode == 500) {
          return const FailureMessage(LocaleKeys.some_thing_wrong);
        }
        final data = e.response?.data;

        if (data == null) return FailureMessage('$e');
        final error = data! is String
            ? jsonDecode(data)['error']['message']
            : data['error']['message'].toString();
        if (error is String) {
          return FailureMessage(error.tr());
        } else if (error is List<String>) {
          return FailureMessage(error.first.tr());
        }
      }
    } catch (_) {
      return FailureMessage('$_');
    }
    return FailureMessage('$e');
  }

  factory FailureMessage.fromRPC(e) {
    try {
      if ('$e'.contains('exceeds allowance')) {
        return const FailureMessage(LocaleKeys.insufficient_balance);
      }
    } catch (_) {
      return FailureMessage('$_');
    }
    return FailureMessage('$e');
  }

  @override
  List<Object?> get props => [msg];

  @override
  String toString() => msg;
}
