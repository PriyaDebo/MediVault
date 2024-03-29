import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medivault/operations/hospital_bl.dart';
import 'package:medivault/screens/Registration/registration.dart';

import '../../all_components/BottomNavigationHospital/bottom_navigation_hospital.dart';
import '../../all_components/background.dart';
import '../../all_components/round_input_field.dart';
import '../../all_components/rounded_button.dart';
import '../../constants.dart';

class Body extends StatefulWidget {
  Body();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController hospitalIdController =
      new TextEditingController();
  final TextEditingController hospitalPasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    return Background(
      child: Scaffold(
          body: Padding(
              padding: EdgeInsets.fromLTRB(
                  height * 0.05, height * 0.05, height * 0.05, 0),
              child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Account Login",
                        style: GoogleFonts.poppins(
                            color: kDarkSlateBlue,
                            fontSize: height * 0.04,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Welcome back to MediVault. To log into your account, please provide your MediVault Id and password.",
                        style: GoogleFonts.poppins(
                            color: kRaisinBlack, fontSize: height * 0.02),
                        textAlign: TextAlign.center,
                      ),
                      RoundInputField(
                        hintText: "MediVault Id",
                        icon: Icons.mail,
                        onChanged: (value) {},
                        controller: hospitalIdController,
                        isObscure: false,
                      ),
                      SizedBox(height: height * 0.009),
                      RoundInputField(
                        hintText: "Password",
                        icon: Icons.lock,
                        onChanged: (value) {},
                        controller: hospitalPasswordController,
                        isObscure: false,
                      ),
                      SizedBox(height: height * 0.009),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account? ",
                            style: GoogleFonts.comfortaa(
                                textStyle: TextStyle(color: kDarkSlateBlue),
                                fontSize: height * 0.02),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Registration(),
                                  ));
                            },
                            child: Text(
                              "REGISTER",
                              style: GoogleFonts.comfortaa(
                                  textStyle: TextStyle(
                                      color: kDarkSlateBlue,
                                      fontWeight: FontWeight.w600),
                                  fontSize: height * 0.02),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height * 0.45),
                        child: RoundButton(
                          text: "LOGIN",
                          press: () async {
                            final id = hospitalIdController.text.trim();
                            final password = hospitalPasswordController.text.trim();

                            if (checkValidityHospital(id, password, context)) {
                              final result =
                              await HospitalBl().validLogin(id, password);
                              if (result != "FAIL") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => BottomNavigationHospital(id)),
                                );
                              } else {
                                final snackBar = SnackBar(
                                  content: Text(
                                    "Invalid Credentials",
                                    style: GoogleFonts.lora(),
                                  ),
                                  duration: Duration(seconds: 2),
                                  behavior: SnackBarBehavior.floating,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            }
                          },
                          color: kDarkSlateBlue,
                          textColor: kWhite,
                        ),
                      )
                    ],
                  )
              )
          )
      ),
    );
  }

  bool checkValidityHospital(String id, String password, context) {
    if (id.isEmpty) {
      final snackBar = SnackBar(
        content: Text(
          "MediVault Id Required",
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
}
