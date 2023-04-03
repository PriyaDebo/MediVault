import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medivault/operations/report_bl.dart';

import '../../all_components/background.dart';
import '../../constants.dart';

class Body extends StatefulWidget {
  final String id;
  Body(this.id);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  late String dataUri = "";
  bool showWidgetA = true;

  getAnalysis() async {
    final List<int> analysis = await ReportBl().getAnalysis(widget.id);
    if (analysis.isNotEmpty) {
      dataUri = Uri.dataFromBytes(analysis, mimeType: 'application/pdf').toString();
      showWidgetA = false;
    }
  }


  @override
  void initState() {
    super.initState();
    getAnalysis();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    return Background(
        child: Scaffold(
            body: Container(
                padding: EdgeInsets.all(height * 0.05),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Report Analysis",
                        style: GoogleFonts.poppins(
                            color: kDarkSlateBlue,
                            fontSize: height * 0.035,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height*0.01),
                      Text(
                        "Get easily readable analysis of all your medical reports at one place!",
                        style: GoogleFonts.poppins(
                            color: kDarkSlateBlue,
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: height*0.03,),
                      showWidgetA
                      ? showNoAnalysisAvailable(height)
                          : showAnalysisAvailable(height),
                    ]
                )
            )
        )
    );
  }

  Text showNoAnalysisAvailable(double height) {
    return Text(
      "No analysis available. Add reports to view analysis.",
      style: GoogleFonts.poppins(
          color: kDarkSlateBlue,
          fontSize: height * 0.04,
          fontWeight: FontWeight.w400),
      textAlign: TextAlign.center,
    );
  }

  Text showAnalysisAvailable(double height) {
    return Text(
      "Analysis available. Loading...",
      style: GoogleFonts.poppins(
          color: kDarkSlateBlue,
          fontSize: height * 0.04,
          fontWeight: FontWeight.w400),
      textAlign: TextAlign.center,
    );
  }
}
