import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medivault/constants.dart';
import 'package:medivault/screens/Analysis/analysis.dart';
import 'package:medivault/screens/HomePatient/home_patient.dart';
import 'package:medivault/screens/ProfilePatient/profile_patient.dart';

class BottomNavigationBody extends StatefulWidget {
  final String id;

  BottomNavigationBody(this.id);
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigationBody> {

  var _selectedPageIndex;
  late List<Widget> _pages;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedPageIndex = 0;
    _pages = [Analysis(), HomePatient(), ProfilePatient(widget.id)];
    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var bnb = Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        physics: new NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kDarkSlateBlue,
        selectedFontSize: size.height * 0.015,
        unselectedFontSize: size.height * 0.015,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: GoogleFonts.secularOne(textStyle: TextStyle()),
        unselectedLabelStyle: GoogleFonts.secularOne(textStyle: TextStyle()),
        selectedItemColor: kThistle,
        unselectedItemColor: kThistle,
        items: <BottomNavigationBarItem>[
          buildItem(size, label: 'Analysis', icon: Icons.analytics_outlined),
          buildItem(size, label: 'Home', icon: Icons.home_rounded),
          buildItem(size, label: 'Profile', icon: Icons.medical_services),
        ],
        onTap: (selectedPageIndex) {
          setState(() {
            _selectedPageIndex = selectedPageIndex;
            _pageController.jumpToPage(selectedPageIndex);
          });
        },
      ),
    );
    return bnb;
  }

  BottomNavigationBarItem buildItem(Size size, {
    required String label, required IconData icon
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}