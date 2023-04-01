import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medivault/all_components/round_input_field.dart';
import 'package:medivault/all_components/rounded_button.dart';
import 'package:medivault/operations/report_bl.dart';

import '../../all_components/background.dart';
import '../../constants.dart';

class Body extends StatefulWidget {
  Body();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  DateTime date = DateTime.now();

  final TextEditingController _patientId = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late File _pdfFile;

  Future<List<int>> getFileBytes(File file) async {
    try {
      List<int> fileBytes = await file.readAsBytes();
      return fileBytes;
    } catch (e) {
      // Handle any exceptions from file operations
      print('Error reading file: $e');
      final list = <int>[];
      return list;
    }
  }

  Future<void> _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() async {
        _pdfFile = File(result.files.single.path!);
        // File pdfFile = File('/path/to/pdf/file.pdf');
        // List<int>? pdfBytes = await getFileBytes(pdfFile);
      });
    }
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        date = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double height = size.height;
    return Background(
        child: Scaffold(
            body: Container(
                padding: EdgeInsets.all(height * 0.05),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Add Reports",
                        style: GoogleFonts.poppins(
                            color: kDarkSlateBlue,
                            fontSize: height * 0.04,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        "Add medical reports easily to patient's account by providing the Patient Id and attaching the medical report in PDF format.",
                        style: GoogleFonts.poppins(
                            color: kRaisinBlack, fontSize: height * 0.02),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.01),
                      RoundInputField(
                          hintText: "Patient Id",
                          icon: Icons.person,
                          onChanged: (value) {},
                          isObscure: false
                      ),
                      SizedBox(height: height * 0.02),
                      RoundButton(
                        text: "Select Date",
                        press: _showDatePicker,
                      ),
                      SizedBox(height: height * 0.02),
                      RoundButton(
                        text: "Attach PDF",
                        press: _openFileExplorer,
                      ),
                      SizedBox(height: height * 0.02),
                      RoundButton(
                        text: "SUBMIT",
                        press: () async {
                          final patientId = _patientId.text.trim();
                          final file = await getFileBytes(_pdfFile);
                          final dateString = date.toString();
                          if (checkValidityHospital(patientId, dateString, file, context)) {
                            final result = await ReportBl().reportUpload(patientId, file, dateString);
                            if (result == "FAIL") {
                              final snackBar = SnackBar(
                                content: Text("Failed to add report", style: GoogleFonts.lora(),),
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                            else {
                              final snackBar = SnackBar(
                                content: Text("Report Added Successfully", style: GoogleFonts.lora(),),
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                )
            )
        )
    );
  }

  bool checkValidityHospital(String patientId, String date, List<int> file, context) {
    if (patientId.isEmpty) {
      final snackBar = SnackBar(
        content: Text(
          "Patient MediVault ID Required.",
          style: GoogleFonts.lora(),
        ),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    } else if (date.isEmpty) {
      final snackBar = SnackBar(
        content: Text(
          "Date required.",
          style: GoogleFonts.lora(),
        ),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    } else if (file.isEmpty) {
      final snackBar = SnackBar(
        content: Text(
          "Please attach file.",
          style: GoogleFonts.lora(),
        ),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false;
    }
    return true;
  }
}
