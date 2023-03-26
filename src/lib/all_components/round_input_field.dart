import 'package:medivault/all_components/rounded_container.dart';
import 'package:medivault/constants.dart';
import 'package:flutter/material.dart';

class RoundInputField extends RoundContainer {
  final String hintText;
  final IconData icon;
  final bool isObscure;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const RoundInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.isObscure,
    this.keyboardType,
    this.controller,
  }) : super(key: key);

  @override
  Widget getChild(size) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      obscureText: isObscure,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: size.height * 0.02),
        prefixIcon: Icon(
          icon,
          color: kDarkSlateBlue,
        ),
        hintText: hintText,
        filled: true,
        fillColor: kLavenderBlush,
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: kDarkSlateBlue,
            ),
            borderRadius: BorderRadius.circular(size.height * 0.5)),
      ),
      cursorColor: kRaisinBlack,
    );
  }
}
