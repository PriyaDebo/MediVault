import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medivault/all_components/background.dart';
import 'package:medivault/constants.dart';
import 'package:medivault/screens/Onboarding/content_model.dart';
import 'package:medivault/screens/SplashScreen/splash_screen.dart';

class Body extends StatefulWidget {
  Body();

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Background(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                      padding: EdgeInsets.all(height * 0.05),
                      child: Column(
                        children: [
                          Image.asset(
                            contents[i].image,
                            height: height * 0.35,
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Text(
                            contents[i].title,
                            style: GoogleFonts.secularOne(
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.w900,
                                color: kDarkSlateBlue),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            contents[i].description,
                            style: GoogleFonts.poppins(
                                fontSize: size.height * 0.02,
                                color: kRaisinBlack),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ));
                }),
          ),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(contents.length,
                    (index) => buildDot(index, context, height, width))),
          ),
          Container(
            height: height * 0.06,
            margin: EdgeInsets.all(height * 0.05),
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                currentIndex == contents.length - 1 ? "Continue" : "Next",
                style: GoogleFonts.poppins(
                    fontSize: size.height * 0.03, color: kLavenderBlush),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SplashScreen()),
                  );
                }
                _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kDarkSlateBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(height * 0.5)),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Container buildDot(
      int index, BuildContext context, double height, double width) {
    return Container(
      height: height * 0.01,
      width: currentIndex == index ? width * 0.04 : width * 0.02,
      margin: EdgeInsets.only(right: width * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height * 0.1),
          color: kDarkSlateBlue),
    );
  }
}
