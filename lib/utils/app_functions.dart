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
