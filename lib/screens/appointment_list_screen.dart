// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/book_appointment_screen.dart';
import 'package:hospital_management_system/screens/dashboard_screen.dart';
import 'package:hospital_management_system/screens/medical_history_screen.dart';
import 'package:hospital_management_system/screens/welcome_screen.dart';
import 'package:hospital_management_system/theme/theme.dart';
import 'package:icons_plus/icons_plus.dart';

class AppointmentListScreen extends StatefulWidget {
  const AppointmentListScreen({super.key});

  @override
  State<AppointmentListScreen> createState() =>
      _AppointmentListScreenState();
}

class _AppointmentListScreenState
    extends State<AppointmentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightColorScheme.secondary,
        title: Text(
          'LifeLine.',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: lightColorScheme.onSecondary),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(BoxIcons.bx_menu_alt_left,
                color: lightColorScheme.onSecondary),
            onPressed: () =>
                Scaffold.of(context).openDrawer(),
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
                  image: AssetImage(
                      "assets/images/receptionist.png"),
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
                        builder: (context) =>
                            DashboardScreen()),
                    (route) => false);
              },
            ),
            ListTile(
              leading: Icon(BoxIcons.bx_plus_circle),
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
                        builder: (context) =>
                            BookAppointmentScreen()),
                    (route) => false);
              },
            ),
            ListTile(
              leading: Icon(BoxIcons.bx_time),
              title: const Text(
                'View Appointment',
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
                        builder: (context) =>
                            AppointmentListScreen()),
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
                    MaterialPageRoute(
                        builder: (context) =>
                            WelcomeScreen()),
                    (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
