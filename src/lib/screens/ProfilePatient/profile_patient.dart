import 'package:flutter/material.dart';
import 'package:medivault/screens/ProfilePatient/body.dart';

class ProfilePatient extends StatelessWidget {
  final String id;
  ProfilePatient(this.id);
  @override
  Widget build(BuildContext context) {
    return Body(id);
  }
}