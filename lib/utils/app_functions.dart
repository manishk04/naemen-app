import 'dart:io';
import 'dart:math';

import 'dart:developer' as developer;

import 'package:intl/intl.dart';
import 'package:naemen/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

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
      '23:59:59', // End time in 'HH:mm a' format (e.g., '0:00 AM' means '11:59 PM')
}) {
  // Parse selected date using the provided format 'dd-MM-yyyy'
  DateTime date = DateFormat('dd-MM-yyyy').parse(selectedDate);

  // Parse start and end times using the provided format 'HH:mm a'
  DateTime startDateTime = DateFormat('HH:mm:ss').parse(startTime);
  DateTime endDateTime = endTime == '0:00 AM'
      ? DateTime(date.year, date.month, date.day, 23, 59,
          59) // Treat '0:00 AM' as '11:59 PM'
      : DateFormat('HH:mm:ss').parse(endTime);

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
    // String startTimeString = DateFormat('hh:mm a').format(startDateTime);
    // String endTimeString = DateFormat('hh:mm a').format(slotEndTime);
    String startTimeString = DateFormat('HH:mm').format(startDateTime);
    String endTimeString = DateFormat('HH:mm').format(slotEndTime);

    // Add the slot to the list
    timeSlots.add('$startTimeString - $endTimeString');

    // Move to the next slot by adding interval minutes
    startDateTime = startDateTime.add(Duration(minutes: intervalMinutes));
  }

  return timeSlots;
}

String convertTimeRangeFormat(String timeRange24) {
  // Split the time range into start and end times
  List<String> times = timeRange24.split(" - ");

  // Parse both times in the 24-hour format
  DateTime startTime = DateFormat("HH:mm").parse(times[0]);
  DateTime endTime = DateFormat("HH:mm").parse(times[1]);

  // Convert both times to 12-hour format with AM/PM
  String formattedStartTime = DateFormat("hh:mm a").format(startTime);
  String formattedEndTime = DateFormat("hh:mm a").format(endTime);

  // Return the formatted time range
  return "$formattedStartTime - $formattedEndTime";
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

bool isAfterCurrent(String dateTime) {
  DateTime currentDateTime = DateTime.now();
  DateTime givenDateTime = DateTime.parse(dateTime);
  if (givenDateTime.isAfter(currentDateTime)) {
    return true;
  }
  return false;
}

double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  const p = 0.017453292519943295; // Pi/180
  const R = 6371; // Radius of the Earth in kilometers
  final a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
  return R * 2 * asin(sqrt(a));
}

Future<void> openMap(
    {required String destinationLat, required String destinationLng}) async {
  try {
    if (Platform.isAndroid) {
      final String googleMapsUrl =
          "https://www.google.com/maps/dir/?api=1&destination=$destinationLat,$destinationLng&travelmode=driving";

      if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
        await launchUrl(Uri.parse(googleMapsUrl));
      } else {
        throw 'Could not launch map';
      }
    } else if (Platform.isIOS) {
      final String appleMapsUrl =
          "https://maps.apple.com/?daddr=$destinationLat,$destinationLng&dirflg=d";

      if (await canLaunchUrl(Uri.parse(appleMapsUrl))) {
        await launchUrl(Uri.parse(appleMapsUrl));
      } else {
        throw 'Could not launch map';
      }
    } else {
      throw 'Could not launch map';
    }
  } catch (e) {
    developer.log(e.toString());
    Utils.toastMessage(e.toString());
  }
}