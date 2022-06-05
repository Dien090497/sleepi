import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DateTimeUtils {
  String chartTimeFormat(DateTime time, Locale locale) {
    return DateFormat("MMM d, yyyy", locale.languageCode).format(time);
  }
}
