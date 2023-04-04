import 'package:medivault/all_components/rounded_container.dart';
import 'package:medivault/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundButton extends RoundContainer {
  final String text;
  final void Function() press;
  final Color color, textColor;

  const RoundButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kDarkSlateBlue,
    this.textColor = kWhite,
  }) : super(key: key);

  @override
  Widget getChild(size) {
    var textStyle = GoogleFonts.comfortaa(
      textStyle: TextStyle(fontSize: size.height*0.02, fontWeight: FontWeight.bold),
    );
    var shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(size.height*0.5));
    var style = TextButton.styleFrom(
        textStyle: textStyle, foregroundColor: textColor, backgroundColor: color, shape: shape);
    return SizedBox(width: size.width*2, height: size.height*1, child: TextButton(style: style, onPressed: press, child: Text(text)));
  }
}
