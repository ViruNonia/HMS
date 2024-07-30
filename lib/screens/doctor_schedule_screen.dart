import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/book_appointment_screen.dart';
import 'package:hospital_management_system/screens/dashboard_screen.dart';
import 'package:hospital_management_system/screens/medical_history_screen.dart';
import 'package:hospital_management_system/screens/welcome_screen.dart';
import 'package:hospital_management_system/theme/theme.dart';
import 'package:icons_plus/icons_plus.dart';

class DoctorScheduleScreen extends StatefulWidget {
  const DoctorScheduleScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DoctorScheduleScreenState();
}

class DoctorScheduleScreenState extends State<DoctorScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen();
  }

  Widget initScreen() {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF37A1FF),
      appBar: AppBar(
        backgroundColor: lightColorScheme.secondary,
        title: Text(
          'LifeLine.',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: lightColorScheme.onSecondary,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              BoxIcons.bx_menu_alt_left,
              color: lightColorScheme.onSecondary,
            ),
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
                  color: Color(0xFFFFFFFF),
                ),
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
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                      (route) => false,
                );
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
                  context,
                  MaterialPageRoute(builder: (context) => MedicalHistoryScreen()),
                      (route) => false,
                );
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
                  context,
                  MaterialPageRoute(builder: (context) => BookAppointmentScreen()),
                      (route) => false,
                );
              },
            ),
            ListTile(
              leading: Icon(BoxIcons.bx_time),
              title: const Text(
                'Doctor Schedule',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorScheduleScreen()),
                      (route) => false,
                );
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
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, left: 20),
              child: Text(
                "Doctor Schedule",
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Divider(
              color: Colors.blue,
              indent: 15,
              endIndent: 15,
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    child: Text(
                      'Top Rated',
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 1),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'See all',
                        style: TextStyle(
                          color: Color(0xff5e5d5d),
                          fontSize: 19,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ListView(
                  children: [
                    demoTopRatedDr(
                      "assets/images/dr_1.png",
                      "Dr. Rajesh Sharma",
                      "Heart Surgeon",
                      "10:00 AM",
                    ),
                    demoTopRatedDr(
                      "assets/images/dr_2.png",
                      "Dr. Priya Kapoor",
                      "Bone Specialist",
                      "11:00 AM",
                    ),
                    demoTopRatedDr(
                      "assets/images/dr_3.png",
                      "Dr. Rahul Singh",
                      "Eyes Specialist",
                      "12:00 PM",
                    ),
                    demoTopRatedDr(
                      "assets/images/dr_1.png",
                      "Dr. Neha Gupta",
                      "Gynecologist",
                      "01:00 PM",
                    ),
                    demoTopRatedDr(
                      "assets/images/dr_2.png",
                      "Dr. Anil Patel",
                      "Dermatologist",
                      "02:00 PM",
                    ),
                    demoTopRatedDr(
                      "assets/images/dr_3.png",
                      "Dr. Aarti Desai",
                      "Pediatrician",
                      "03:00 PM",
                    ),
                    demoTopRatedDr(
                      "assets/images/dr_1.png",
                      "Dr. Sanjay Kumar",
                      "Orthopedic Surgeon",
                      "04:00 PM",
                    ),
                    demoTopRatedDr(
                      "assets/images/dr_2.png",
                      "Dr. Meera Reddy",
                      "Psychiatrist",
                      "05:00 PM",
                    ),
                    demoTopRatedDr(
                      "assets/images/dr_3.png",
                      "Dr. Vikram Malhotra",
                      "Neurologist",
                      "06:00 PM",
                    ),
                    demoTopRatedDr(
                      "assets/images/dr_1.png",
                      "Dr. Radha Sharma",
                      "Dentist",
                      "07:00 PM",
                    ),
                    demoTopRatedDr(
                      "assets/images/dr_2.png",
                      "Dr. Suresh Tiwari",
                      "Urologist",
                      "08:00 PM",
                    ),
                    demoTopRatedDr(
                      "assets/images/dr_3.png",
                      "Dr. Pooja Singh",
                      "ENT Specialist",
                      "09:00 PM",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget demoCategories(String img, String name, String drCount) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Color(0xff107163),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(img),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Color(0xffd9fffa).withOpacity(0.07),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              drCount,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget demoTopRatedDr(
      String img, String name, String speciality, String time) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 90,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 90,
            width: 50,
            child: Image.asset(img),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Color(0xff363636),
                      fontSize: 17,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Text(
                        speciality,
                        style: TextStyle(
                          color: Color(0xffababab),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3, left: size.width * 0.25),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Time: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                time,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}