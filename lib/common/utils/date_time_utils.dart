import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

// ignore_for_file: non_constant_identifier_names
@Injectable()
class DateTimeUtils {
  String MMMdyyyy(DateTime time, [Locale? locale]) {
    return DateFormat("MMM d, yyyy", locale?.languageCode ?? 'en').format(time);
  }

  String MMMd(DateTime time, [Locale? locale]) {
    return DateFormat("MMM d", locale?.languageCode ?? 'en').format(time);
  }

  String d(DateTime time, [Locale? locale]) {
    return DateFormat("d", locale?.languageCode ?? 'en').format(time);
  }

  DateTime startOfWeek(DateTime time) {
    final int currentDay = time.weekday;
    return time.subtract(Duration(days: currentDay - 1));
  }

  DateTime endOfWeek(DateTime time) {
    final int currentDay = time.weekday;
    return time.add(Duration(days: DateTime.daysPerWeek - currentDay));
  }

  DateTime startOfMonth(DateTime time) {
    return DateTime(time.year, time.month, 1);
  }

  DateTime endOfMonth(DateTime time) {
    return DateTime(time.year, time.month + 1, 0);
  }
}
