// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/welcome_screen.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../theme/theme.dart';
import 'dashboard_screen.dart';
import 'doctor_schedule_screen.dart';
import 'medical_history_screen.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() =>
      _BookAppointmentScreenState();
}

class _BookAppointmentScreenState
    extends State<BookAppointmentScreen> {
  //controllers
  final nameController = new TextEditingController();
  final phNumberController = new TextEditingController();
  final appointmentDateController =
  new TextEditingController();
  final genderController = new TextEditingController();
  final addressController = new TextEditingController();
  final deptController = new TextEditingController();
  final drNameController = new TextEditingController();
  String? _selectedDepartment;
  String? _selectedDoctor;
  List<String> _doctorList = [];
  // Firestore instance
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;
  String? _selectedGender;
  // Function to add data to Firestore
  Future<void> _addAppointment() async {
    try {
      await _firestore.collection('appointments').add({
        'name': nameController.text,
        'phoneNumber': phNumberController.text,
        'appointmentDate': appointmentDateController.text,
        'gender': genderController.text,
        'address': addressController.text,
        'department': deptController.text,
        'doctorName': drNameController.text,
      });
      // Clear text fields after successful submission
      nameController.clear();
      phNumberController.clear();
      appointmentDateController.clear();
      genderController.clear();
      addressController.clear();
      deptController.clear();
      drNameController.clear();
      // Optionally, you can show a success message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Appointment booked successfully!'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      // Handle any errors that occur during the process
      print('Error adding appointment: $e');
      // Optionally, you can show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Error booking appointment. Please try again later.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightColorScheme.secondary,
          title: Text(
            'Book Appointment',
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
                          builder: (context) =>
                              BookAppointmentScreen()),
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
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(
                25.0, 50.0, 25.0, 20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Form(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Text(
                    'Book Your Appointment',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{3,}$');
                      if (value!.isEmpty) {
                        return ("name cannot be empty");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Enter valid name(min 3 characters)");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      nameController.text = value!;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      label: const Text('Full Name'),
                      hintText: 'Enter Full Name',
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors
                              .black12, // Default border color
                        ),
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors
                              .black12, // Default border color
                        ),
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: phNumberController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      RegExp regex =
                      RegExp(r'^[6-9]\d{9}$');
                      if (value!.isEmpty) {
                        return "Phone number cannot be empty";
                      }
                      if (!regex.hasMatch(value)) {
                        return "Enter a valid 10-digit phone number starting with 6, 7, 8, or 9";
                      }
                      if (value.length != 10) {
                        return "Phone number must be exactly 10 digits long";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      nameController.text = value!;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      label: const Text('Contact Number'),
                      hintText: 'Enter Contact Number',
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors
                              .black12, // Default border color
                        ),
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors
                              .black12, // Default border color
                        ),
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: appointmentDateController,
                    keyboardType: TextInputType.datetime,
                    readOnly:
                    true, // Set to true to prevent manual text input
                    onTap: () async {
                      // Show Date Picker Dialog
                      DateTime? selectedDate =
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(
                            DateTime.now().year + 5),
                      );
                      if (selectedDate != null) {
                        // Update the text field when a date is selected
                        appointmentDateController.text =
                        "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Date cannot be empty");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon:
                      Icon(Icons.calendar_month),
                      label: const Text('Appointment Date'),
                      hintText: 'Select Appointment Date',
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors
                              .black12, // Default border color
                        ),
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors
                              .black12, // Default border color
                        ),
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedGender = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Gender cannot be empty";
                      }
                      return null;
                    },
                    items: <String>['Male', 'Female']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                          Icons.supervised_user_circle),
                      labelText: 'Gender',
                      hintText: 'Select Your Gender',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors
                              .black12, // Default border color
                        ),
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors
                              .black12, // Default border color
                        ),
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: addressController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return ("Address cannot be empty");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Enter your address");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      nameController.text = value!;
                    },
                    decoration: InputDecoration(
                      prefixIcon:
                      Icon(Icons.location_on_outlined),
                      label: const Text('Address'),
                      hintText: 'Enter Your Address',
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors
                              .black12, // Default border color
                        ),
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors
                              .black12, // Default border color
                        ),
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedDepartment,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDepartment = newValue;
                        // Update the list of doctors based on the selected department
                        _updateDoctorList(newValue);
                        // Clear the selected doctor when the department changes
                        _selectedDoctor = null;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Department cannot be empty";
                      }
                      return null;
                    },
                    items: <String>[
                      'Cardiology',
                      'Dermatology',
                      'Endocrinology',
                      'Gastroenterology',
                      'Neurology',
                      'Ophthalmology',
                      'Orthopedics',
                      // Add more departments as needed
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.list_alt),
                      labelText: 'Department',
                      hintText: 'Select The Department',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors
                              .black12, // Default border color
                        ),
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors
                              .black12, // Default border color
                        ),
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedDoctor,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDoctor = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Doctor name cannot be empty";
                      }
                      return null;
                    },
                    items: _doctorList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_add),
                      labelText: 'Doctor Name',
                      hintText: 'Select Doctor Name',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors
                              .black12, // Default border color
                        ),
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors
                              .black12, // Default border color
                        ),
                        borderRadius:
                        BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle form submission
                      },
                      child: const Text(
                        'Book Appointment',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _updateDoctorList(String? department) {
    if (department == 'Cardiology') {
      _doctorList = [
        'Dr. Ajay Patel',
        'Dr. Neha Sharma',
        'Dr. Ravi Gupta'
      ];
    } else if (department == 'Dermatology') {
      _doctorList = [
        'Dr. Priya Singh',
        'Dr. Vivek Reddy',
        'Dr. Ananya Choudhury'
      ];
    } else if (department == 'Endocrinology') {
      _doctorList = [
        'Dr. Sanjay Kumar',
        'Dr. Pooja Verma',
        'Dr. Rahul Mishra'
      ];
    } else if (department == 'Gastroenterology') {
      _doctorList = [
        'Dr. Meera Jain',
        'Dr. Vikram Singh',
        'Dr. Ayesha Khan'
      ];
    } else if (department == 'Neurology') {
      _doctorList = [
        'Dr. Anand Sharma',
        'Dr. Reena Gupta',
        'Dr. Siddharth Patel'
      ];
    } else if (department == 'Ophthalmology') {
      _doctorList = [
        'Dr. Nisha Bhatia',
        'Dr. Sameer Joshi',
        'Dr. Kavita Sharma'
      ];
    } else if (department == 'Orthopedics') {
      _doctorList = [
        'Dr. Rajesh Kumar',
        'Dr. Deepika Singh',
        'Dr. Anil Yadav'
      ];
    } else {
      _doctorList = [];
    }
  }
}