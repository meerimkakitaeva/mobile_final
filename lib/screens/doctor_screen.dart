import 'package:flutter/material.dart';

class DoctorScreen extends StatefulWidget {
  final Map<String, String> doctor;
  final Function(String) onAppointmentSelected;

  const DoctorScreen({super.key, required this.doctor, required this.onAppointmentSelected});

  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  String? selectedTime;

  final List<String> availableTimes = [
    '09:00 - 10:00',
    '10:00 - 11:00',
    '11:00 - 12:00',
    '12:00 - 13:00',
    '14:00 - 15:00',
    '15:00 - 16:00',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text(widget.doctor['name']!),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doctor['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Specialty: ${widget.doctor['specialty']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Available Hours:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: availableTimes.length,
              itemBuilder: (context, index) {
                final time = availableTimes[index];
                return RadioListTile<String>(
                  title: Text(time),
                  value: time,
                  groupValue: selectedTime,
                  onChanged: (value) {
                    setState(() {
                      selectedTime = value;
                    });
                  },
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedTime == null
                  ? null
                  : () {
                      widget.onAppointmentSelected(selectedTime!);
                      Navigator.pop(context); 
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedTime == null ? Colors.grey : Colors.greenAccent,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
