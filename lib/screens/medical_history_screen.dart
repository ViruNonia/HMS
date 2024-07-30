// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/book_appointment_screen.dart';
import 'package:hospital_management_system/screens/dashboard_screen.dart';
import 'package:hospital_management_system/screens/welcome_screen.dart';
import 'package:hospital_management_system/theme/theme.dart';
import 'package:icons_plus/icons_plus.dart';

class MedicalHistoryScreen extends StatefulWidget {
  const MedicalHistoryScreen({super.key});

  @override
  State<MedicalHistoryScreen> createState() => _MedicalHistoryScreenState();
}

class _MedicalHistoryScreenState extends State<MedicalHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightColorScheme.secondary,
          title: Text(
            'LifeLine.',
            style: TextStyle(
                fontFamily: 'Poppins', color: lightColorScheme.onSecondary),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(BoxIcons.bx_menu_alt_left,
                  color: lightColorScheme.onSecondary),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF37A1FF),
                  image: DecorationImage(
                    image: AssetImage("assets/images/receptionist.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(
                  'Welcome \nBack',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
              ListTile(
                leading: Icon(BoxIcons.bx_home_alt),
                title: const Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen()),
                      (route) => false);
                },
              ),
              ListTile(
                leading: Icon(BoxIcons.bx_history),
                title: const Text(
                  'Medical History',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => MedicalHistoryScreen()),
                      (route) => false);
                },
              ),
              ListTile(
                leading: Icon(BoxIcons.bx_time),
                title: const Text(
                  'Book Appointment',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => BookAppointmentScreen()),
                      (route) => false);
                },
              ),

              Divider(
                thickness: 0.7,
                color: Color(0xFF1A1C18).withOpacity(0.3),
              ),
              ListTile(
                leading: Icon(BoxIcons.bx_exit),
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      (route) => false);
                },
              ),
            ],
          ),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(children: [
                Text('Medical History',
                  style: TextStyle(
                    color: lightColorScheme.primary,
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),),
                DataTable(
                  columns: <DataColumn>[
                    DataColumn(
                      label: Container(
                        padding: EdgeInsets.only(
                            bottom: 2), // Add padding for the border
                        child: Text(
                          'Condition',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.black), // Set the border color
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Container(
                        padding: EdgeInsets.only(
                            bottom: 2), // Add padding for the border
                        child: Text(
                          'Diagnosis Date',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.black), // Set the border color
                          ),
                        ),
                      ),
                    ),
                  ],
                  rows: const <DataRow>[
                    DataRow(cells: [
                      DataCell(Text(
                        'Hypertension',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                      DataCell(Text(
                        '2022-03-15',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        'Diabetes',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                      DataCell(Text(
                        '2019-07-22',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        'Asthma',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                      DataCell(Text(
                        '2018-02-10',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        'Allergies',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                      DataCell(Text(
                        'N/A',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                    ])
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text('Vital Signs',
                  style: TextStyle(
                    color: lightColorScheme.primary,
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),),
                DataTable(
                  columns: <DataColumn>[
                    DataColumn(
                      label: Container(
                        padding: EdgeInsets.only(
                            bottom: 2), // Add padding for the border
                        child: Text(
                          'Measurement',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.black), // Set the border color
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Container(
                        padding: EdgeInsets.only(
                            bottom: 2), // Add padding for the border
                        child: Text(
                          'Result',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.black), // Set the border color
                          ),
                        ),
                      ),
                    ),
                  ],
                  rows: const <DataRow>[
                    DataRow(cells: [
                      DataCell(Text(
                        'Heart Rate',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                      DataCell(Text(
                        '72 bpm',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        'Blood Pressure',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                      DataCell(Text(
                        '120/80 mmHg',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                        'Temperature',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                      DataCell(Text(
                        '98.6\u00B0 F',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ]),
                  ],
                ),
              ]),
            )));
  }
}