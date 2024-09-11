import 'package:intl/intl.dart';

List<String> getNextSevenDays() {
  List<String> dates = [];
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');

  for (int i = 0; i < 7; i++) {
    DateTime nextDate = DateTime.now().add(Duration(days: i));
    dates.add(dateFormat.format(nextDate));
  }

  return dates;
}

List<String> generateTimeSlots({
  required int intervalMinutes,
  required int slotDurationMinutes,
  required String
      startTime, // Start time in 'HH:mm a' format (e.g., '10:52 AM')
  required String selectedDate, // Selected date in 'dd-MM-yyyy' format
  String endTime =
      '11:59 PM', // End time in 'HH:mm a' format (e.g., '0:00 AM' means '11:59 PM')
}) {
  // Parse selected date using the provided format 'dd-MM-yyyy'
  DateTime date = DateFormat('dd-MM-yyyy').parse(selectedDate);

  // Parse start and end times using the provided format 'HH:mm a'
  DateTime startDateTime = DateFormat('HH:mm a').parse(startTime);
  DateTime endDateTime = endTime == '0:00 AM'
      ? DateTime(date.year, date.month, date.day, 23,
          59) // Treat '0:00 AM' as '11:59 PM'
      : DateFormat('HH:mm a').parse(endTime);

  // Adjust start and end times to the selected date
  startDateTime = DateTime(date.year, date.month, date.day, startDateTime.hour,
      startDateTime.minute);
  endDateTime = DateTime(
      date.year, date.month, date.day, endDateTime.hour, endDateTime.minute);

  DateTime now = DateTime.now(); // Current time for comparison
  List<String> timeSlots = [];

  // If the selected date is today and the current time is after the start time, round to the next interval
  if (now.isAfter(startDateTime) &&
      now.day == date.day &&
      now.month == date.month &&
      now.year == date.year) {
    startDateTime = getRoundedTime(now, intervalMinutes);
  }

  // Generate all time slots if the selected date is after the current date
  if (date.isAfter(now)) {
    int hour = startDateTime.hour;
    int minute = startDateTime.minute;
    startDateTime = DateTime(date.year, date.month, date.day, hour, minute);
  }

  // Generate time slots
  while (startDateTime
      .add(Duration(minutes: slotDurationMinutes))
      .isBefore(endDateTime)) {
    // End time for each slot
    DateTime slotEndTime =
        startDateTime.add(Duration(minutes: slotDurationMinutes));

    // Format time in HH:mm
    String startTimeString = DateFormat('HH:mm a').format(startDateTime);
    String endTimeString = DateFormat('HH:mm a').format(slotEndTime);

    // Add the slot to the list
    timeSlots.add('$startTimeString - $endTimeString');

    // Move to the next slot by adding interval minutes
    startDateTime = startDateTime.add(Duration(minutes: intervalMinutes));
  }

  return timeSlots;
}

DateTime getRoundedTime(DateTime currentTime, int intervalMinutes) {
  int minute = currentTime.minute;
  int mod = minute % intervalMinutes;
  int roundedMinute = (mod == 0) ? minute : minute + (intervalMinutes - mod);

  // Return rounded time, ensuring not to exceed 59 minutes
  return DateTime(
    currentTime.year,
    currentTime.month,
    currentTime.day,
    currentTime.hour,
    roundedMinute >= 60 ? 0 : roundedMinute,
  ).add(Duration(hours: roundedMinute >= 60 ? 1 : 0));
}

String convertDate(String dateStr) {
  DateFormat inputFormat = DateFormat('dd-MM-yyyy');
  DateTime dateTime = inputFormat.parse(dateStr);

  String day = DateFormat('d').format(dateTime);
  String dayWithSuffix = _addDaySuffix(int.parse(day));

  String monthYear = DateFormat('MMMM yyyy').format(dateTime);

  return '$dayWithSuffix $monthYear';
}

String convertMinutesToHourMinutes(int minutes) {
  if (minutes < 60) {
    return "$minutes mins";
  } else if (minutes == 60) {
    return "1 hr";
  }
  int hour = minutes ~/ 60;
  int minute = minutes % 60;
  if (minute == 0) {
    return "$hour hrs";
  }
  return "$hour hrs $minute mins";
}

String _addDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return '${day}th';
  }
  switch (day % 10) {
    case 1:
      return '${day}st';
    case 2:
      return '${day}nd';
    case 3:
      return '${day}rd';
    default:
      return '${day}th';
  }
}
