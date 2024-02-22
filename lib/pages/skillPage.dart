import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utils/colors.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({Key? key}) : super(key: key);

  @override
  _SkillPageState createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late double b, h;

  double sideLineHeight = 0;
  late final AnimationController controller1;
  late final AnimationController controller2;
  late final AnimationController controller3;
  late final AnimationController controller4;
  late final Animation<double> animation1;
  late final Animation<double> animation2;
  late final Animation<double> animation3;
  late final Animation<double> animation4;
  @override
  void initState() {
    startAnim();

    controller1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    controller3 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    controller4 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation1 = Tween(begin: 0.0, end: 1.0).animate(controller1);
    animation2 = Tween(begin: 0.0, end: 1.0).animate(controller2);
    animation3 = Tween(begin: 0.0, end: 1.0).animate(controller3);
    animation4 = Tween(begin: 0.0, end: 1.0).animate(controller4);
    super.initState();
  }

  startAnim() async {
    await Future.delayed(Duration(seconds: 1));
    sideLineHeight = h * 0.8;
    setState(() {});

    await Future.delayed(Duration(seconds: 1));
    controller1.forward();
    await Future.delayed(Duration(milliseconds: 500));
    controller2.forward();
    await Future.delayed(Duration(milliseconds: 500));
    controller3.forward();
    await Future.delayed(Duration(milliseconds: 500));
    controller4.forward();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    b = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      color: darkColor,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 5,
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: 4,
                    height: sideLineHeight,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: b * 0.015,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeTransition(
                        opacity: animation1,
                        child: Row(
                          children: [
                            RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                "Languages",
                                style: TextStyle(
                                    color: selectColor,
                                    fontSize: h * 0.023,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: b * 0.015,
                            ),
                            skillIcon('assets/images/c-icon.png', "C"),
                            skillIcon('assets/images/cpp-icon.png', "C++"),
                            skillIcon('assets/images/dart-icon.png', "Dart"),
                            skillIcon('assets/images/java-icon.png', "Java"),
                            skillIcon(
                                'assets/images/kotlin-icon.png', "Kotlin"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.020,
                      ),
                      FadeTransition(
                        opacity: animation2,
                        child: Row(
                          children: [
                            RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                "Frameworks/Technologies",
                                style: TextStyle(
                                    color: selectColor,
                                    fontSize: h * 0.023,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: b * 0.015,
                            ),
                            skillIcon(
                                'assets/images/flutter-icon.png', "Flutter"),
                            skillIcon(
                                'assets/images/android-icon.png', "Android"),
                            skillIcon(
                                'assets/images/nodejs-icon.png', "Node JS"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.020,
                      ),
                      FadeTransition(
                        opacity: animation3,
                        child: Row(
                          children: [
                            RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                "Databases",
                                style: TextStyle(
                                    color: selectColor,
                                    fontSize: h * 0.023,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: b * 0.015,
                            ),
                            skillIcon('assets/images/sql-icon.png', "SQL"),
                            skillIcon('assets/images/hive-icon.png', "HiveDB"),
                            skillIcon('assets/images/roomdb-icon.png', "Room"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.020,
                      ),
                      FadeTransition(
                        opacity: animation4,
                        child: Row(
                          children: [
                            RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                "Misc.",
                                style: TextStyle(
                                    color: selectColor,
                                    fontSize: h * 0.023,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: b * 0.015,
                            ),
                            skillIcon(
                                'assets/images/firebase-icon.png', "Firebase"),
                          ],
                        ),
                      )
                    ],
                  ),
                  Spacer(
                    flex: 7,
                  )
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Skills",
              style: GoogleFonts.montserrat(
                color: Colors.white.withOpacity(0.1),
                fontSize: min(80, b * 0.14),
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  skillIcon(String file, String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: min(b * 0.014, 20)),
      child: Column(
        children: [
          Image.asset(
            file,
            height: min(b * 0.08, 70),
          ),
          SizedBox(
            height: h * 0.025,
          ),
          Text(
            name,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
