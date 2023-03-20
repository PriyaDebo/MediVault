import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medivault/all_components/background.dart';
import 'information_first.dart';

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
    return Background(
        child: Scaffold(

        ));
  }
}