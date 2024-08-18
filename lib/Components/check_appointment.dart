import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  bool _isLoading = false;

  Future<void> _checkArtistAvailability() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate a network request or delay
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // Example: Check if the artist is available
    bool isArtistAvailable = _isArtistAvailable();

    // Show the popup
    _showAvailabilityPopup(isArtistAvailable);
  }

  bool _isArtistAvailable() {
    // Logic to determine if the artist is available
    // This is just an example, you would replace this with your actual logic
    return DateTime.now().second % 2 == 0;  // Just a random condition
  }

  void _showAvailabilityPopup(bool isAvailable) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isAvailable ? 'Artist Available' : 'Artist Unavailable'),
          content: Text(isAvailable
              ? 'The artist is available for the appointment.'
              : 'The artist is not available at the moment.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: _checkArtistAvailability,
                child: Text('Book Appointment'),
              ),
      ),
    );
  }
}


