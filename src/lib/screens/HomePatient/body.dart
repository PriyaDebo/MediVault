import 'dart:io';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../all_components/background.dart';
import '../../all_components/round_input_field.dart';
import '../../all_components/rounded_button.dart';
import '../../constants.dart';

class Body extends StatefulWidget {
  Body();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {

    final TextEditingController _patientId = new TextEditingController();

    final _formKey = GlobalKey<FormState>();
    late File _pdfFile;

    Future<List<int>?> getFileBytes(File file) async {
      try {
        List<int> fileBytes = await file.readAsBytes();
        return fileBytes;
      } catch (e) {
        // Handle any exceptions from file operations
        print('Error reading file: $e');
        return null;
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

    Size size = MediaQuery
        .of(context)
        .size;
    double height = size.height;
    double width = size.width;

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
                      SizedBox(height: height * 0.02),
                      RoundButton(
                        text: "Attach PDF",
                        press: _openFileExplorer,
                      ),
                      SizedBox(height: height * 0.02),
                      RoundButton(
                        text: "SUBMIT",
                        press: () async {
                          final snackBar = SnackBar(
                            content: Text("Report added successfully", style: GoogleFonts.lora(),),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          setState(() {

                          });
                          // final patientId = _patientId.text.trim();
                          // final file = getFileBytes(_pdfFile);
                          // final dateString = date.toString();
                          // if (checkValidityHospital(patientId, dateString, file as List<int>, context)) {
                          //   final result = await ReportBl().reportUpload(patientId, file as List<int>, dateString);
                          //   if (result == "FAIL") {
                          //     final snackBar = SnackBar(
                          //       content: Text("Failed to add report", style: GoogleFonts.lora(),),
                          //       duration: Duration(seconds: 2),
                          //       behavior: SnackBarBehavior.floating,
                          //     );
                          //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          //   }
                          //   else {
                          //     final snackBar = SnackBar(
                          //       content: Text("Report Added Successfully", style: GoogleFonts.lora(),),
                          //       duration: Duration(seconds: 2),
                          //       behavior: SnackBarBehavior.floating,
                          //     );
                          //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          //   }
                          // }
                        },
                      ),
                    ],
                  ),
                )
            )
        )
    );
  }
}