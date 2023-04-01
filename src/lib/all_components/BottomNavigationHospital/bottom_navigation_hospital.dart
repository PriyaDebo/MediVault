import 'package:flutter/material.dart';
import 'package:medivault/all_components/BottomNavigationHospital/body.dart';

class BottomNavigationHospital extends StatelessWidget{
  final String id;
  BottomNavigationHospital(this.id);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBody(id);
  }
}