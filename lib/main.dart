import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/appointment_screen.dart';
import 'screens/medical_card_screen.dart';
import 'screens/doctor_screen.dart';

void main() {
  runApp(MedicalApp());
}

class MedicalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/home': (context) => HomeScreen(),
        '/appointment': (context) => AppointmentScreen(),
        '/medicalCard': (context) => MedicalCardScreen(),
      },
    );
  }
}
