import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../all_components/background.dart';
import '../../constants.dart';

class Body extends StatefulWidget {
  Body();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double height = size.height;
    double width = size.width;
    return Background(
      child: Scaffold(
          body: Container(
              padding: EdgeInsets.all(height * 0.05),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Profile Details ",
                      style: GoogleFonts.poppins(
                          color: kDarkSlateBlue,
                          fontSize: height * 0.035,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.01),
                    Container(
                      decoration: BoxDecoration(
                        color: kLavenderBlush,
                        borderRadius: BorderRadius.circular(height * 0.01),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(height * 0.01),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Name: $Placeholder",
                                    style: GoogleFonts.poppins(
                                        color: kDarkSlateBlue,
                                        fontSize: height * 0.025,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Email: $Placeholder",
                                    style: GoogleFonts.poppins(
                                        color: kDarkSlateBlue,
                                        fontSize: height * 0.025,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.01),
                    Text(
                      "Reports",
                      style: GoogleFonts.poppins(
                          color: kDarkSlateBlue,
                          fontSize: height * 0.035,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.01),
                  ]
              )
          )
      ),
    );
  }
}