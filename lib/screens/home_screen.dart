import 'package:flutter/material.dart';
import 'doctor_screen.dart';
import 'medical_card_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<Map<String, String>> doctors = [
    {'name': 'Ivan Aydarov', 'specialty': 'Cardiologist'},
    {'name': 'Alina Sergeeva', 'specialty': 'Therapist'},
    {'name': 'Aleksei Alekseev', 'specialty': 'Surgeon'},
    {'name': 'Valentina Petrova', 'specialty': 'Pediatrician'},
    {'name': 'Irina Smirnova', 'specialty': 'Ophthalmologist'},
    {'name': 'Sergey Ilyin', 'specialty': 'Neurologist'},
    {'name': 'Dina Romanova', 'specialty': 'Gynecologist'},
    {'name': 'Konstantin Orlov', 'specialty': 'Dermatologist'},
    {'name': 'Viktor Sidorov', 'specialty': 'Endocrinologist'},
    {'name': 'Elena Mikhaylova', 'specialty': 'Otolaryngologist'},
  ];

  List<Map<String, String>> appointments = [];

  void addAppointment(Map<String, String> doctor, String time) {
    setState(() {
      appointments.add({
        'doctorName': doctor['name']!,
        'specialty': doctor['specialty']!,
        'time': time,
      });
    });
  }

  void cancelAppointment(int index) {
    setState(() {
      appointments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('Online Doctor Appointment'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/medicalCard');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: Text(
                'My Medical Card',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            appointments.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Appointments:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: appointments.length,
                          itemBuilder: (context, index) {
                            final appointment = appointments[index];
                            return Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                title: Text('${appointment['doctorName']}'),
                                subtitle: Text('${appointment['time']}'),
                                trailing: IconButton(
                                  icon: Icon(Icons.cancel, color: Colors.red),
                                  onPressed: () {
                                    cancelAppointment(index);
                                  },
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DoctorScreen(
                                        doctor: {
                                          'name': appointment['doctorName']!,
                                          'specialty': appointment['specialty']!,
                                        },
                                        onAppointmentSelected: (time) {
                                          addAppointment(appointment, time);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'You have no appointments yet',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(doctor['name']!, style: TextStyle(fontSize: 18)),
                      subtitle: Text(doctor['specialty']!),
                      trailing: Icon(Icons.arrow_forward, color: Colors.blue),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorScreen(
                              doctor: doctor,
                              onAppointmentSelected: (time) {
                                addAppointment(doctor, time);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
