extension DateTimeExension on DateTime {
  bool compareExactDay(DateTime dateTime) {
    return year == dateTime.year &&
        month == dateTime.month &&
        day == dateTime.day;
  }
}
