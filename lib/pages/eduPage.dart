import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/home.dart';
import 'package:my_portfolio/utils/colors.dart';
import 'package:my_portfolio/utils/responsive_widget.dart';

class EduPage extends StatefulWidget {
  const EduPage({Key? key}) : super(key: key);

  @override
  _EduPageState createState() => _EduPageState();
}

class _EduPageState extends State<EduPage> with AutomaticKeepAliveClientMixin {
  double midLineLength = 0;
  double circleRadius = 0;
  double schoolCardOpacity = 0;
  double collegeCardOpacity = 0;

  double schoolCardLeftPos = 0;
  double collegeCardRightPos = 0;

  late double screenHeight;
  late double screenWidth;
  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      schoolCardLeftPos = (controller.page! - 1.9) * screenWidth;
      collegeCardRightPos = (controller.page! - 1.9) * screenWidth;
      // if (mounted) setState(() {});
    });
  }

  startAnimation() async {
    if (!ResponsiveWidget.isSmallScreen(context)) {
      await Future.delayed(Duration(microseconds: 500));
      circleRadius = 30;
      setState(() {});

      await Future.delayed(Duration(seconds: 1));
      midLineLength = screenHeight * 0.7;
      setState(() {});

      await Future.delayed(Duration(seconds: 2));
      schoolCardOpacity = 1;
      setState(() {});

      await Future.delayed(Duration(milliseconds: 500));
      collegeCardOpacity = 1;
      setState(() {});
    }
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    startAnimation();

    return ResponsiveWidget(
      largeScreen: Container(
        color: darkColor,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (screenWidth > screenHeight)
                  AnimatedContainer(
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 500),
                    width: circleRadius,
                    height: circleRadius,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Spacer(),
                          AnimatedOpacity(
                            duration: Duration(seconds: 1),
                            opacity: schoolCardOpacity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    schoolCard(400),
                                    RotatedBox(
                                      quarterTurns: 1,
                                      child: Text(
                                        "2017 - 2019",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            color: selectColor,
                                            fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 300,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (screenWidth > screenHeight)
                      AnimatedContainer(
                        duration: Duration(seconds: 2),
                        height: midLineLength,
                        width: 5,
                        color: Colors.white,
                        curve: Curves.decelerate,
                      ),
                    Expanded(
                      child: Row(
                        children: [
                          AnimatedOpacity(
                            duration: Duration(seconds: 1),
                            opacity: collegeCardOpacity,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.4,
                                ),
                                Row(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: 3,
                                      child: Text(
                                        "2020 - 2024",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            color: selectColor,
                                            fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    collegeCard(400)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            bottomTitle()
          ],
        ),
      ),
      smallScreen: Container(
        // alignment: Alignment.center,
        child: Stack(
          children: [
            AnimatedPositioned(
              top: screenHeight * 0.25,
              left: schoolCardLeftPos,
              curve: Curves.easeOut,
              duration: Duration(milliseconds: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  schoolCard(null),
                  SizedBox(
                    width: 20,
                  ),
                  RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      "2017 - 2019",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          color: selectColor,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            AnimatedPositioned(
              right: collegeCardRightPos,
              top: screenHeight * 0.55,
              curve: Curves.easeOut,
              duration: Duration(milliseconds: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "2020 - 2024",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          color: selectColor,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  collegeCard(null),
                ],
              ),
            ),
            bottomTitle()
          ],
        ),
      ),
    );
  }

  bottomTitle() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        "Education",
        style: GoogleFonts.montserrat(
          color: Colors.white.withOpacity(0.1),
          fontSize: min(80, screenWidth * 0.14),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget collegeCard(double? width) {
    return Card(
      color: Colors.transparent,
      elevation: 10,
      child: Container(
        width: width,
        padding: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.all(16),
          child: SizedBox(
            width: screenWidth * 0.65,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "GLA University ,Mathura(U.P.)",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                Text(
                  "Bachelor of Technology",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Computer Science Engineering",
                  style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  "CPI : 7.5",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget schoolCard(double? width) {
    return Card(
      color: Colors.transparent,
      elevation: 10,
      child: Container(
        width: width,
        padding: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.all(16),
          child: SizedBox(
            width: screenWidth * 0.65,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MPSM Grace Convent Sr. Sec. School, Mathura",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                Text(
                  "HSC & SSC",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Non-Medical + Computer Science (C++)",
                  style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  "84.4%",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
