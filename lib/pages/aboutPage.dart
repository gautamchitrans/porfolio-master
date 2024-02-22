import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/home.dart';
import 'package:my_portfolio/utils/colors.dart';
import 'package:my_portfolio/utils/responsive_widget.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  double profileRadius = 0;
  double h = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.page! <= 1)
        profileRadius = (controller.page!) * h * 0.3;
      else
        profileRadius = (2 - controller.page!) * h * 0.3;
    });
  }

  @override
  Widget build(BuildContext context) {
    var b = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    return ResponsiveWidget(
      largeScreen: Container(
        color: darkColor,
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: ProfileImageContainer(
                      radius: profileRadius,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("I'm ",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: h * 0.024,
                                    fontWeight: FontWeight.w300)),
                            AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  "an App Developer \u{1f4f1}",
                                  curve: Curves.ease,
                                  speed: Duration(milliseconds: 100),
                                  textStyle: GoogleFonts.poppins(
                                    color: selectColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: h * 0.024,
                                  ),
                                ),
                                TypewriterAnimatedText(
                                  "a Linux Operator \u{1f4bb}",
                                  curve: Curves.ease,
                                  speed: Duration(milliseconds: 100),
                                  textStyle: GoogleFonts.poppins(
                                    color: selectColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: h * 0.024,
                                  ),
                                ),
                                TypewriterAnimatedText(
                                  "an Athlete \u{1f6b4}",
                                  curve: Curves.ease,
                                  speed: Duration(milliseconds: 100),
                                  textStyle: GoogleFonts.poppins(
                                    color: selectColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: h * 0.024,
                                  ),
                                ),
                                TypewriterAnimatedText(
                                  "an Indian 🇮🇳",
                                  curve: Curves.ease,
                                  speed: Duration(milliseconds: 100),
                                  textStyle: GoogleFonts.poppins(
                                    color: selectColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: h * 0.024,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            width: MediaQuery.of(context).size.width / 2.6,
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                text: "Hey Visitor 👋, I'm ",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: h * 0.018),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Gautam Chitransh ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "an enthusiast of mobile technologies and linux systems. I've a good experience in Flutter and Android. Currently digging the domains of Cyber Security and Machine Learning, and exploring its possibilities with mobile devices.\nVideo editing, sports & music listening are some other activities you'll find me engaged with.",
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text("About Me",
                  style: GoogleFonts.montserrat(
                    color: Colors.white.withOpacity(0.1),
                    fontSize: min(80, b * 0.14),
                    fontWeight: FontWeight.bold,
                  )),
            )
          ],
        ),
      ),
      smallScreen: Container(
          color: darkColor,
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileImageContainer(
                      radius: profileRadius,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: b * 0.45,
                      child: Row(
                        children: [
                          Text(
                            "I'm ",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: h * 0.024,
                                fontWeight: FontWeight.w300),
                          ),
                          AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TypewriterAnimatedText(
                                "a App Developer \u{1f4f1}",
                                curve: Curves.ease,
                                speed: Duration(milliseconds: 100),
                                textStyle: GoogleFonts.poppins(
                                  color: selectColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: h * 0.024,
                                ),
                              ),
                              TypewriterAnimatedText(
                                "a DSA enthusiast \u{1f4bb}",
                                curve: Curves.ease,
                                speed: Duration(milliseconds: 100),
                                textStyle: GoogleFonts.poppins(
                                  color: selectColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: h * 0.024,
                                ),
                              ),
                              TypewriterAnimatedText(
                                "an Athlete \u{1f6b4}",
                                curve: Curves.ease,
                                speed: Duration(milliseconds: 100),
                                textStyle: GoogleFonts.poppins(
                                  color: selectColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: h * 0.024,
                                ),
                              ),
                              TypewriterAnimatedText(
                                "an Indian 🇮🇳",
                                curve: Curves.ease,
                                speed: Duration(milliseconds: 100),
                                textStyle: GoogleFonts.poppins(
                                  color: selectColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: h * 0.024,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Hey Visitor 👋, I'm ",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: h * 0.018),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Gautam Chitransh ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "🚀 Data Alchemist & Flutter Maestro Crafting magic with data structures, algorithms, and Flutter to conjure immersive digital experiences. Let's collaborate and create something extraordinary! ✨.\n\nVideo editing, sports & music listening are some other activities you'll find me engaged with.",
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "About Me",
                  style: GoogleFonts.montserrat(
                    color: Colors.white.withOpacity(0.1),
                    fontSize: min(80, b * 0.14),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class ProfileImageContainer extends StatefulWidget {
  ProfileImageContainer({Key? key, required this.radius}) : super(key: key);
  final double radius;

  @override
  State<ProfileImageContainer> createState() => _ProfileImageContainerState();
}

class _ProfileImageContainerState extends State<ProfileImageContainer> {
  var shadow;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        shadow = BoxShadow(
          color: Colors.white.withOpacity(0.3),
          blurRadius: 60,
          spreadRadius: 10,
        );
        setState(() {});
      },
      onExit: (event) {
        shadow = null;
        setState(() {});
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
        height: widget.radius,
        width: widget.radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectColor,
          boxShadow: shadow == null ? null : [shadow],
          image: DecorationImage(
              fit: BoxFit.contain,
              scale: 1,
              image: AssetImage(
                "assets/images/myimage.png",
              )),
        ),
      ),
    );
  }
}
