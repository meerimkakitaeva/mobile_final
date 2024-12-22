import 'package:flutter/material.dart';

class MedicalCardScreen extends StatelessWidget {
  const MedicalCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('Medical Card'),
        backgroundColor: Colors.blueAccent, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Medical Card',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 10),
                Text('Full Name: Ivan Ivanovich Ivanov', style: TextStyle(fontSize: 16)),
                Text('Date of Birth: 10.05.1990', style: TextStyle(fontSize: 16)),
                Text('Gender: Male', style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                Text(
                  'Medical History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 10),
                Text('Allergies: None', style: TextStyle(fontSize: 16)),
                Text('Chronic Diseases: Hypertension', style: TextStyle(fontSize: 16)),
                Text('Medications: Lisinopril, Aspirin', style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
            
                Text(
                  'Recent Visits',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 10),
                Text('Date: 20.12.2024 - Visit to the Therapist', style: TextStyle(fontSize: 16)),
                Text('Date: 10.11.2024 - Visit to the Cardiologist', style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 10),
                Text('Phone: +996 123 456 789', style: TextStyle(fontSize: 16)),
                Text('Email: ivanov@mail.com', style: TextStyle(fontSize: 16)),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent, 
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text('Back', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
