import 'dart:io';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../all_components/background.dart';
import '../../all_components/rounded_button.dart';
import '../../constants.dart';
import '../../operations/report_bl.dart';

class Body extends StatefulWidget {
  final String id;
  Body(this.id);

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
        File pdfFile = File('/path/to/pdf/file.pdf');
        List<int>? pdfBytes = await getFileBytes(pdfFile);
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
                        "Add medical reports easily to your account by simply attaching the medical report in PDF format.",
                        style: GoogleFonts.poppins(
                            color: kRaisinBlack, fontSize: height * 0.02),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height * 0.01),
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
                          final dateString = date.toString();
                          if (await _pdfFile.exists()) {
                            if (await checkValidity(widget.id, dateString, _pdfFile, context)) {
                              final file = await getFileBytes(_pdfFile);
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

  Future<bool> checkValidity(String patientId, String date, File file, context) async {
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
    } else if (!await file.exists()) {
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