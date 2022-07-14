import 'package:injectable/injectable.dart';
import 'package:jiffy/jiffy.dart';

// ignore_for_file: non_constant_identifier_names
@Injectable()
class DateTimeUtils {
  String ddMMyyyyHHmm(DateTime time) {
    return Jiffy(time).format("dd/MM/yyyy HH:mm");
  }

  String MMMdyyyy(DateTime time) {
    return Jiffy(time).format("MMM do, yyyy");
  }
  String HHmm(DateTime time) {
    return Jiffy(time).format("HH:mm");
  }

  String MMMdo(DateTime time) {
    return Jiffy(time).format("MMM do");
  }

  String doFormat(DateTime time) {
    return Jiffy(time).format("do");
  }

  DateTime startOfWeek(DateTime time) {
    final int currentDay = time.weekday;
    return time.subtract(Duration(days: currentDay - 1));
  }

  DateTime endOfWeek(DateTime time, {bool checkNow = false}) {
    final int currentDay = time.weekday;
    if (checkNow) {
      final now = DateTime.now();
      if (now.isBefore(time) || now.isAtSameMomentAs(time)) return now;
    }
    return time.add(Duration(days: DateTime.daysPerWeek - currentDay));
  }

  DateTime startOfMonth(DateTime time) {
    return DateTime(time.year, time.month, 1);
  }

  DateTime endOfMonth(DateTime time, {bool checkNow = false}) {
    if (checkNow) {
      final now = DateTime.now();
      if (now.isBefore(time) || now.isAtSameMomentAs(time)) {
        return DateTime(now.year, now.month, now.day);
      }
    }
    return DateTime(time.year, time.month + 1, 0);
  }

  DateTime addMonth(DateTime time, int months) {
    return Jiffy(time).add(months: months).dateTime;
  }

  DateTime subtractMonth(DateTime time, int months) {
    return Jiffy(time).subtract(months: months).dateTime;
  }
}
