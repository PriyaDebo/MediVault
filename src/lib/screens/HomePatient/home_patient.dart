import 'package:flutter/material.dart';
import 'package:medivault/screens/HomePatient/body.dart';

class HomePatient extends StatelessWidget {
  final String id;
  HomePatient(this.id);

  @override
  Widget build(BuildContext context) {
    return Body(id);
  }
}