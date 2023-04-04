import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medivault/operations/report_bl.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

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
  late List<int> analysis;

  Future<List<int>> getAnalysis() async {
    print("Getting called here");
    // print("Printing analysis: ${await ReportBl().getAnalysis(widget.id)}");
    analysis = await ReportBl().getAnalysis(widget.id);
    print("here");
    print("Analysis $analysis");
    if (analysis.isNotEmpty) {
      dataUri = Uri.dataFromBytes(analysis, mimeType: 'application/pdf').toString();
      showWidgetA = false;
    }

    return analysis;
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
    double width = size.width;
    return Background(
        child: Scaffold(
            body: Container(
                padding: EdgeInsets.all(height * 0.05),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
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
                      FutureBuilder(
                        future: getAnalysis(),
                        builder: (context, AsyncSnapshot<List<int>> snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            print("Inside FB $showWidgetA");
                            if (showWidgetA) {
                              return showNoAnalysisAvailable(height);
                            } else {
                              return showAnalysisAvailable(height, width);
                            }
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
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

  Container showAnalysisAvailable(double height, double width) {
    // return Text(
    //   "Analysis available. Loading...",
    //   style: GoogleFonts.poppins(
    //       color: kDarkSlateBlue,
    //       fontSize: height * 0.04,
    //       fontWeight: FontWeight.w400),
    //   textAlign: TextAlign.center,
    // );
    return Container(
      height: height * 0.55,
      width: width,
      decoration: BoxDecoration(color: kLavenderBlush),
      child: Image.memory(Uint8List.fromList(analysis), fit: BoxFit.fill,)
    );
  }

}
