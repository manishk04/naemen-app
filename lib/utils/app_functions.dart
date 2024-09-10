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

List<String> getNextTimeSlots(Duration interval) {
  List<String> times = [];
  DateTime now = DateTime.now();
  DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59);
  DateFormat timeFormat = DateFormat('hh:mm a');

  DateTime nextSlot = now.add(Duration(
    minutes: interval.inMinutes - (now.minute % interval.inMinutes),
  ));

  nextSlot = DateTime(nextSlot.year, nextSlot.month, nextSlot.day,
      nextSlot.hour, nextSlot.minute);

  while (nextSlot.isBefore(endOfDay)) {
    times.add(timeFormat.format(nextSlot));
    nextSlot = nextSlot.add(interval);
  }

  if (nextSlot.hour == 23 && nextSlot.minute < 59) {
    times.add(timeFormat.format(endOfDay));
  }

  return times;
}

String getRoundedTime() {
  DateTime now = DateTime.now();

  // Calculate minutes to add to round up to the next 15-minute interval
  int remainder = now.minute % 15;
  int minutesToAdd = remainder == 0 ? 0 : 15 - remainder;

  // Add the minutes to the current time
  DateTime roundedTime = now.add(Duration(minutes: minutesToAdd));

  // Format the time in HH:mm format
  String formattedTime = DateFormat('HH:mm').format(roundedTime);

  return formattedTime;
}

List<String> generateTimeSlots({
  required int intervalMinutes,
  required int slotDurationMinutes,
  String endTime = '23:59',
}) {
  // Parse start and end times
  DateTime now = DateTime.now();
  String startTime = getRoundedTime();
  DateTime startDateTime = DateTime(now.year, now.month, now.day,
      int.parse(startTime.split(':')[0]), int.parse(startTime.split(':')[1]));
  DateTime endDateTime = DateTime(now.year, now.month, now.day,
      int.parse(endTime.split(':')[0]), int.parse(endTime.split(':')[1]));

  List<String> timeSlots = [];

  while (startDateTime
      .add(Duration(minutes: slotDurationMinutes))
      .isBefore(endDateTime)) {
    // End time for each slot
    DateTime slotEndTime =
        startDateTime.add(Duration(minutes: slotDurationMinutes));

    // Format time in HH:mm
    String startTimeString = DateFormat('HH:mm').format(startDateTime);
    String endTimeString = DateFormat('HH:mm').format(slotEndTime);

    // Add the slot to the list
    timeSlots.add('$startTimeString - $endTimeString');

    // Move to the next slot by adding interval minutes
    startDateTime = startDateTime.add(Duration(minutes: intervalMinutes));
  }

  return timeSlots;
}

String convertDate(String dateStr) {
  DateFormat inputFormat = DateFormat('dd-MM-yyyy');
  DateTime dateTime = inputFormat.parse(dateStr);

  String day = DateFormat('d').format(dateTime);
  String dayWithSuffix = _addDaySuffix(int.parse(day));

  String monthYear = DateFormat('MMMM yyyy').format(dateTime);

  return '$dayWithSuffix $monthYear';
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
