import 'package:flutter/material.dart';

import '../../all_components/background.dart';

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
          body: Text("hospital"),
        )
    );
  }
}