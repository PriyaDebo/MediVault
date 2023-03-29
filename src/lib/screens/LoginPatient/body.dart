import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medivault/screens/HomePatient/home_patient.dart';

import '../../all_components/BottomNavigationPatient/bottom_navigation_patient.dart';
import '../../all_components/background.dart';
import '../../all_components/round_input_field.dart';
import '../../all_components/rounded_button.dart';
import '../../constants.dart';
import '../Registration/registration.dart';

class Body extends StatefulWidget {
  Body();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

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
                SizedBox(height: height * 0.01),
                Text(
                  "Welcome back to MediVault. To log into your account, please provide your username and password.",
                  style: GoogleFonts.poppins(
                      color: kRaisinBlack, fontSize: height * 0.02),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.01),
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavigationPatient(),
                            ));
                      },
                      color: kDarkSlateBlue,
                      textColor: kWhite,
                    ),
                )
              ],
            )
            )),
      ),
    );
  }
}
