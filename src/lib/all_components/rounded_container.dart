import 'package:flutter/material.dart';

abstract class RoundContainer extends StatelessWidget {

  const RoundContainer({
    Key? key,
  }) : super(key: key);

  Widget getChild(size);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var child = getChild(size);

    return Container(
      child: child,
      width: double.infinity,
      height: size.height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.height*0.6),
      ),
    );
  }
}