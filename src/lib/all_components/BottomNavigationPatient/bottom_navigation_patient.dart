import 'package:flutter/material.dart';
import 'package:medivault/all_components/BottomNavigationPatient/body.dart';

class BottomNavigationPatient extends StatelessWidget{
  final String id;
  BottomNavigationPatient(this.id);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBody(id);
  }
}