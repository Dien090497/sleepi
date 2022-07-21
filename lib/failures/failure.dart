import 'dart:convert';

import 'package:dio/dio.dart';
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
        final error = data is String
            ? jsonDecode(data)['error']['message']
            : data['error']['details']['message'];
        if (error is String) {
          return FailureMessage(error);
        } else if (error is List<String>) {
          return FailureMessage(error.first);
        }
      }
    } catch (_) {
      throw Exception(_);
    }
    throw Exception(e);
  }

  @override
  List<Object?> get props => [msg];

  @override
  String toString() => msg;
}
