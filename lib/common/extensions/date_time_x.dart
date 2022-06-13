extension DateTimeX on DateTime {
  bool isTheSameDay(DateTime other) {
    return DateTime(year, month, day).difference(other) <
        const Duration(days: 1);
  }
}
