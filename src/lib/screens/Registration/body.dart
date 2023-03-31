import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medivault/all_components/BottomNavigationHospital/bottom_navigation_hospital.dart';
import 'package:medivault/all_components/round_input_field.dart';
import 'package:medivault/operations/hospital_bl.dart';
import 'package:medivault/screens/HomeHospital/home_hospital.dart';
import 'package:medivault/screens/HomePatient/home_patient.dart';
import 'package:medivault/screens/LoginHospital/login_hospital.dart';
import 'package:medivault/screens/LoginPatient/login_patient.dart';

import '../../all_components/BottomNavigationPatient/bottom_navigation_patient.dart';
import '../../all_components/background.dart';
import '../../constants.dart';

class Body extends StatefulWidget {
  Body();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController ageController = new TextEditingController();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController hospitalPasswordController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();

  late String gender = '';

  late bool hospitalPressed = false;
  late bool patientPressed = false;

  List<Map<String, String>> _formData = [
    {'account': ''},
    {'username': '', 'password': '', 'gender': '', 'age': ''},
  ];

  String? _genderValue = '';

  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Background(
      child: Scaffold(
          body: Column(
        children: [
          LinearProgressIndicator(
            value: (currentIndex + 1) / _formData.length,
            minHeight: height * 0.01,
          ),
          SizedBox(height: height * 0.04),
          Text('${currentIndex + 1} / ${_formData.length}',
              style: GoogleFonts.poppins(
                  color: kDarkSlateBlue,
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center),
          Expanded(
            child: Form(
              child: PageView.builder(
                controller: _controller,
                itemCount: _formData.length,
                itemBuilder: (_, i) {
                  switch (i) {
                    case 0:
                      return selectAccount(height, width);
                    case 1:
                      return _formData[0]['account'] == 'Hospital' ? fillHospitalDetails(height, width) : fillPatientDetails(height, width);
                    default:
                      return Container();
                  }
                },
                onPageChanged: (i) {
                  setState(() {
                    currentIndex = i;
                  });
                },
              ),
            ),
          ),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_formData.length,
                        (index) => buildDot(index, context, height, width))),
          ),
          Container(
            height: height * 0.06,
            margin: EdgeInsets.fromLTRB(height * 0.05, height * 0.03, height * 0.05, height * 0.05),
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                currentIndex == _formData.length - 1 ? "Register" : "Continue",
                style: GoogleFonts.poppins(
                    fontSize: size.height * 0.03, color: kLavenderBlush),
                textAlign: TextAlign.center,
              ),
              onPressed: () async {
                if (currentIndex == _formData.length - 1) {
                  if (_formData[0]['account'] == 'Hospital') {
                    final password = passwordController.text.trim();
                    final name = nameController.text.trim();
                    final contact = phoneController.text.trim();
                    if (checkValidityHospital(name, password, contact, context)) {
                      final result = await HospitalBl().validRegister(name, password, contact);
                      if (result != "FAIL") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => BottomNavigationHospital()),
                        );
                      }
                      else {
                        final snackBar = SnackBar(
                          content: Text("Registration Failed", style: GoogleFonts.lora(),),
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  }
                  else {
                    final username = usernameController.text.trim();
                    final password = passwordController.text.trim();
                    if (checkValidityPatient(username, password, context)) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => BottomNavigationPatient()),
                      );
                    }
                  }
                } else {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kDarkSlateBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(height * 0.5)),
              ),
            ),
          )
        ],
      )),
    );
  }

  Container buildDot(
      int index, BuildContext context, double height, double width) {
    return Container(
      height: height * 0.01,
      width: currentIndex == index ? width * 0.04 : width * 0.02,
      margin: EdgeInsets.only(right: width * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height * 0.1),
          color: kDarkSlateBlue),
    );
  }

  Widget selectAccount(double height, double width) {
    return Padding(
      padding: EdgeInsets.all(height * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Select Account Type",
            style: GoogleFonts.poppins(
                color: kDarkSlateBlue,
                fontSize: height * 0.03,
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height*0.005,),
          Text(
            "Welcome to MediVault. To create a new account, please provide an username and choose a secure password.",
            style: GoogleFonts.poppins(
                color: kRaisinBlack, fontSize: height * 0.02),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height*0.01,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: kDarkSlateBlue,
              backgroundColor: hospitalPressed ? kThistle : kLavenderBlush,
              padding: EdgeInsets.all(height*0.01)
            ),
            onPressed: (){
              setState(() {
                _formData[0]['account'] = 'Hospital';
                hospitalPressed = true;
                patientPressed = false;
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/hospital.png", height: height*0.15,width: width*0.4,),
                SizedBox(width: width*0.03,),
                Expanded (
                  child: Column(
                    children: [
                      Text(
                        "Hospital",
                        style: GoogleFonts.poppins(
                            color: kDarkSlateBlue,
                            fontSize: height * 0.03,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: height*0.005,),
                      Text(
                        "Hospitals can upload medical reports to patient accounts.",
                        style: GoogleFonts.poppins(
                            color: kRaisinBlack, fontSize: height * 0.015),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height*0.01,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: kDarkSlateBlue,
                backgroundColor: patientPressed ? kThistle : kLavenderBlush,
                padding: EdgeInsets.all(height*0.01)
            ),
            onPressed: (){
              setState(() {
                _formData[0]['account'] = 'Patient';
                hospitalPressed = false;
                patientPressed = true;
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/patient.png", height: height*0.15,width: width*0.4,),
                SizedBox(width: width*0.03,),
                Expanded (
                  child: Column(
                    children: [
                      Text(
                        "Patient",
                        style: GoogleFonts.poppins(
                            color: kDarkSlateBlue,
                            fontSize: height * 0.03,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: height*0.005,),
                      Text(
                        "Patients can view analysis of their medical reports and share them with others.",
                        style: GoogleFonts.poppins(
                            color: kRaisinBlack, fontSize: height * 0.015),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ]
      ),
    );
  }

  Widget fillPatientDetails(double height, double width) {
    return Padding(
        padding: EdgeInsets.fromLTRB(height * 0.05, height * 0.05, height * 0.05, 0),
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create Your Account",
              style: GoogleFonts.poppins(
                  color: kDarkSlateBlue,
                  fontSize: height * 0.04,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            Text(
              "Welcome to MediVault. To create a new account, please provide an username and choose a secure password.",
              style: GoogleFonts.poppins(
                  color: kRaisinBlack, fontSize: height * 0.02),
              textAlign: TextAlign.center,
            ),
            RoundInputField(
              hintText: "Username",
              icon: Icons.person,
              onChanged: (value) {},
              controller: usernameController,
              isObscure: false,
            ),
            SizedBox(height: height * 0.01),
            RoundInputField(
              hintText: "Password",
              icon: Icons.lock,
              onChanged: (value) {},
              controller: passwordController,
              isObscure: false,
            ),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account? ",
                  style: GoogleFonts.comfortaa(textStyle: TextStyle(color: kDarkSlateBlue), fontSize: height * 0.02),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPatient(),
                        ));
                  },
                  child: Text(
                    "SIGN IN",
                    style: GoogleFonts.comfortaa(textStyle: TextStyle(color: kDarkSlateBlue, fontWeight: FontWeight.w600), fontSize: height * 0.02),
                  ),
                ),
              ],
            ),
          ],
        )));
  }

  Widget addMorePatientDetails(double height, double width) {
    return Padding(
        padding: EdgeInsets.fromLTRB(height * 0.05, height * 0.05, height * 0.05, 0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Text(
              "Additional Details ",
              style: GoogleFonts.poppins(
                  color: kDarkSlateBlue,
                  fontSize: height * 0.04,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.01),
            Text(
              "We just need a bit more information to help personalize your experience. Please enter your age and gender in the fields below.",
              style: GoogleFonts.poppins(
                  color: kRaisinBlack, fontSize: height * 0.02),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.01),
            RoundInputField(
              hintText: "Age",
              icon: Icons.format_list_numbered,
              onChanged: (value) {},
              controller: ageController,
              isObscure: false,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: height * 0.01),
            Container(
              width: double.infinity,
              height: height * 0.06,
              padding: EdgeInsets.all(height * 0.01),
              decoration: BoxDecoration(
                color: kLavenderBlush,
                borderRadius: BorderRadius.circular(height * 0.5),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  Text(
                    'Gender:',
                    style: TextStyle(fontSize: height * 0.02),
                  ),
                  Radio<String>(
                    value: 'Male',
                    groupValue: _genderValue,
                    onChanged: (value) {
                      setState(() {
                        _genderValue = value;
                        _formData[1]['gender'] = value!;
                      });
                    },
                  ),
                  Text(
                    'M',
                    style: TextStyle(fontSize: height * 0.02),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Radio<String>(
                    value: 'Female',
                    groupValue: _genderValue,
                    onChanged: (value) {
                      setState(() {
                        _genderValue = value as String;
                        _formData[1]['gender'] = value;
                      });
                    },
                  ),
                  Text(
                    'F',
                    style: TextStyle(fontSize: height * 0.02),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Radio<String>(
                    value: 'Other',
                    groupValue: _genderValue,
                    onChanged: (value) {
                      setState(() {
                        _genderValue = value as String;
                        _formData[1]['gender'] = value;
                      });
                    },
                  ),
                  Text(
                    'O',
                    style: TextStyle(fontSize: height * 0.02),
                  ),
                ],
              ),
            ),
          ],
        )));
  }

  bool checkValidityPatient(String username, String password, context) {
    if (username.isEmpty) {
      final snackBar = SnackBar(
        content: Text(
          "Username Required",
          style: GoogleFonts.lora(),
        ),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    } else if (password.isEmpty) {
      final snackBar = SnackBar(
        content: Text(
          "Password required",
          style: GoogleFonts.lora(),
        ),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    return true;
  }


  Widget fillHospitalDetails(double height, double width) {
    return Padding(
        padding: EdgeInsets.fromLTRB(height * 0.05, height * 0.05, height * 0.05, 0),
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create Your Account",
                  style: GoogleFonts.poppins(
                      color: kDarkSlateBlue,
                      fontSize: height * 0.04,
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.01),
                Text(
                  "Welcome to MediVault. To create a new account, please provide your email and choose a secure password.",
                  style: GoogleFonts.poppins(
                      color: kRaisinBlack, fontSize: height * 0.02),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.01),
                RoundInputField(
                  hintText: "Name",
                  icon: Icons.home,
                  onChanged: (value) {},
                  controller: nameController,
                  isObscure: false,
                ),
                SizedBox(height: height * 0.01),
                RoundInputField(
                  hintText: "Password",
                  icon: Icons.lock,
                  onChanged: (value) {},
                  controller: hospitalPasswordController,
                  isObscure: false,
                ),
                SizedBox(height: height * 0.01),
                RoundInputField(
                  hintText: "Contact",
                  icon: Icons.phone,
                  onChanged: (value) {},
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  isObscure: false,
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account? ",
                      style: GoogleFonts.comfortaa(textStyle: TextStyle(color: kDarkSlateBlue), fontSize: height * 0.02),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginHospital(),
                            ));
                      },
                      child: Text(
                        "SIGN IN",
                        style: GoogleFonts.comfortaa(textStyle: TextStyle(color: kDarkSlateBlue, fontWeight: FontWeight.w600), fontSize: height * 0.02),
                      ),
                    ),
                  ],
                ),
              ],
            )
        )
    );
  }

  Widget fillMoreHospitalDetails(double height, double width) {
    return Padding(
        padding: EdgeInsets.fromLTRB(height * 0.05, height * 0.05, height * 0.05, 0),
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Additional Details ",
                  style: GoogleFonts.poppins(
                      color: kDarkSlateBlue,
                      fontSize: height * 0.04,
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.01),
                Text(
                  "We just need a bit more information to help personalize your experience. Please enter hospital name and contact information.",
                  style: GoogleFonts.poppins(
                      color: kRaisinBlack, fontSize: height * 0.02),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.01),
                RoundInputField(
                  hintText: "Name",
                  icon: Icons.home,
                  onChanged: (value) {},
                  controller: nameController,
                  isObscure: false,
                ),
                SizedBox(height: height * 0.01),
                RoundInputField(
                  hintText: "Contact",
                  icon: Icons.phone,
                  onChanged: (value) {},
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  isObscure: false,
                ),
              ],
            )
        )
    );
  }

  bool checkValidityHospital(String email, String password, String contact, context) {
    if (email.isEmpty) {
      final snackBar = SnackBar(
        content: Text(
          "Email Required",
          style: GoogleFonts.lora(),
        ),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    } else if (password.isEmpty) {
      final snackBar = SnackBar(
        content: Text(
          "Password required",
          style: GoogleFonts.lora(),
        ),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    } else if (contact.isEmpty) {
      final snackBar = SnackBar(
        content: Text(
          "Contact required",
          style: GoogleFonts.lora(),
        ),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    return true;
  }
}