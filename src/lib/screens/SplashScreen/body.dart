import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medivault/constants.dart';
import 'package:medivault/screens/InformationFirst/information_first.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  Body();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InformationFirst()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        child: SafeArea(
          child: Scaffold(
              backgroundColor: kLavenderBlush,
              body: Container(
                alignment: Alignment.center,
                child: Scaffold(
                  body: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/logo.png", height: size.height * 0.15, width: size.height * 0.8,),
                            Text(
                                  'MEDIVAULT',
                                  style: GoogleFonts.monoton(fontSize: size.height * 0.04, color: kDarkSlateBlue),
                                ),
                          ]
                      )
                  ),
                ),
              )
          ),
        )
    );
  }
}
