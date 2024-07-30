// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hospital_management_system/screens/appointment_list_screen.dart';
import 'package:hospital_management_system/theme/theme.dart';
import 'package:icons_plus/icons_plus.dart';

import 'admin_dashboard_screen.dart';
import 'dashboard_screen.dart';
import 'doctor_dashboard_screen.dart';

class aViewAppointmentScreen extends StatefulWidget {
  const aViewAppointmentScreen({super.key});

  @override
  State<aViewAppointmentScreen> createState() => _ViewAppointmentScreenState();
}

class _ViewAppointmentScreenState extends State<aViewAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: lightColorScheme.onSecondary),),
        backgroundColor: lightColorScheme.primary,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(BoxIcons.bx_arrow_back,
                color: lightColorScheme.onSecondary),
            onPressed: () =>
                Navigator.pushAndRemoveUntil(
                    (context),
                    MaterialPageRoute(
                        builder: (context) =>
                            AdminDashboardScreen()),
                        (route) => false),
          ),
        ),
        // bar color
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('appointments').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red), // Error text color
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Loading indicator color
              ),
            );
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'No previous form data available.',
                style: TextStyle(fontSize: 18.0), // Text size
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var appointmentData = snapshot.data!.docs[index];
              return Card(
                elevation: 2.0, // Add elevation to card for shadow effect
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Card margin
                child: ListTile(
                  title: Text(
                    'Appointment ID: ${appointmentData.id}',
                    style: TextStyle(fontWeight: FontWeight.bold), // Title font weight
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailText('Name:', appointmentData['name']),
                      _buildDetailText('Phone Number:', appointmentData['phoneNumber']),
                      _buildDetailText('Appointment Date:', appointmentData['appointmentDate']),
                      _buildDetailText('Gender:', appointmentData['gender']),
                      _buildDetailText('Address:', appointmentData['address']),
                      _buildDetailText('Department:', appointmentData['department']),
                      _buildDetailText('Doctor Name:', appointmentData['doctorName']),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildDetailText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
