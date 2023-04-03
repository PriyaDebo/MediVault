import 'package:flutter/material.dart';
import 'package:medivault/screens/Analysis/body.dart';

class Analysis extends StatelessWidget {
  final String id;

  Analysis(this.id);
  @override
  Widget build(BuildContext context) {
    return Body(id);
  }
}