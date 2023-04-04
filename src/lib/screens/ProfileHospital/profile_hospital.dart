import 'package:flutter/material.dart';
import 'package:medivault/screens/ProfileHospital/body.dart';

class ProfileHospital extends StatelessWidget {
  final String id;
  ProfileHospital(this.id);

  @override
  Widget build(BuildContext context) {
    return Body(id);
  }
}