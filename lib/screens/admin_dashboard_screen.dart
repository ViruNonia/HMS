// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/admin_reg_screen.dart';
import 'package:hospital_management_system/screens/doctor_reg_screen.dart';
import 'package:hospital_management_system/screens/doctor_schedule_screen.dart';
import 'package:hospital_management_system/screens/medical_history_screen.dart';
import 'package:hospital_management_system/screens/view_appointments_screen.dart';
import 'package:hospital_management_system/screens/welcome_screen.dart';
import 'package:hospital_management_system/theme/theme.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:table_calendar/table_calendar.dart';

import 'appoint_doctor.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() =>
      _MyAdminDashboardScreen();
}

class _MyAdminDashboardScreen
    extends State<AdminDashboardScreen> {
  late PageController _pageController;
  late DateTime _currentMonth;
  CalendarFormat _currentFormat = CalendarFormat.month;

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
                            AdminDashboardScreen()),
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
                        builder: (context) =>
                            MedicalHistoryScreen()),
                    (route) => false);
              },
            ),
            ListTile(
              leading: Icon(BoxIcons.bx_history),
              title: const Text(
                'Register Doctor',
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
                            DoctorSignUpScreen()),
                    (route) => false);
              },
            ),
            ListTile(
              leading: Icon(BoxIcons.bx_history),
              title: const Text(
                'Register Admin',
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
                            AdminSignUpScreen()),
                    (route) => false);
              },
            ),
            ListTile(
              leading: Icon(BoxIcons.bx_plus_circle),
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
                            aViewAppointmentScreen()),
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
                'Admin Logout',
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
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: lightColorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(
                          horizontal: 30),
                  title: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('adminreg')
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot>
                            snapshot) {
                      if (snapshot.hasError) {
                        return Text(
                          'Welcome', // Default text
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: lightColorScheme
                                    .onPrimary,
                                fontFamily: 'Poppins',
                              ),
                        );
                      }

                      if (!snapshot.hasData ||
                          snapshot.data!.docs.isEmpty) {
                        return Text(
                          'Welcome', // Default text
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: lightColorScheme
                                    .onPrimary,
                                fontFamily: 'Poppins',
                              ),
                        );
                      }

                      var adminData =
                          snapshot.data!.docs.first;
                      var adminName = adminData['name'];
                      return Text(
                        'Welcome $adminName', // Display admin name
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              color: lightColorScheme
                                  .onPrimary,
                              fontFamily: 'Poppins',
                            ),
                      );
                    },
                  ),
                  subtitle: Text(
                    'Have a look at our departments.',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                          color: Colors.white54,
                          fontFamily: 'Poppins',
                        ),
                  ),
                  trailing: const CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFF6EAEE7),
                    backgroundImage: AssetImage(
                        'assets/images/doctor.png'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: lightColorScheme.primary,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(150))),
              child: GridView.count(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard(
                    'Total Doctors: 85',
                    ImageIcon(
                      AssetImage(
                          'assets/images/doctorcom.png'),
                      color: Colors.white,
                      size: 40,
                    ),
                    lightColorScheme.primary,
                  ),
                  itemDashboard(
                    'Total Patients: 954',
                    ImageIcon(
                      AssetImage(
                          'assets/images/patientcom.png'),
                      color: Colors.white,
                      size: 40,
                    ),
                    lightColorScheme.primary,
                  ),
                  itemDashboard(
                    'Total Beds: 1000',
                    ImageIcon(
                      AssetImage('assets/images/bed.png'),
                      color: Colors.white,
                      size: 40,
                    ),
                    lightColorScheme.primary,
                  ),
                  itemDashboard(
                    'Last Maintenance: 6 Months ago',
                    ImageIcon(
                      AssetImage(
                          'assets/images/history.png'),
                      color: Colors.white,
                      size: 40,
                    ),
                    lightColorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(25),
            elevation:
                5.0, // Adjust the elevation as needed
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2040, 3, 14),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              onFormatChanged: (format) {
                setState(() {
                  _currentFormat = format;
                });
              },
              onDaySelected: (selectedDay, focusedDay) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'Selected day: ${selectedDay.day}')),
                );
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, _) {
                  return Center(
                    child: Text(
                      day.day.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
                selectedBuilder: (context, day, _) {
                  return Center(
                    child: Text(
                      day.day.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  itemDashboard(
          String title, ImageIcon icon, Color background) =>
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context)
                      .primaryColor
                      .withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: icon,
            ),
            const SizedBox(height: 8),
            Text(title,
                style: TextStyle(
                    color: Colors.black87, fontSize: 14)),
          ],
        ),
      );
}
