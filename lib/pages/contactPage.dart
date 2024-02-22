import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/extensions/hover_extentions.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    var b = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.center,
      color: darkColor,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't be Shy",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: min(45, h * 0.05),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "say Hi !!!",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: min(30, h * 0.035),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(
                        color: Color(0xff242323),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Text(
                          "Drop a mail at",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(
                                    'mailto:chitranshg529@gmail.com'));
                              },
                              child: Text(
                                "chitranshg529@gmail.com",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "OR",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Follow me on Social Media",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                launchUrlString(
                                    'https://www.instagram.com/gautam_4real/');
                              },
                              child: Image.asset(
                                'assets/images/instagram-colour.png',
                                width: min(50, b * 0.07),
                              ),
                            ).showCursor.zoomInOnHoverSmall,
                            SizedBox(
                              width: min(15, b * 0.02),
                            ),
                            GestureDetector(
                              onTap: () {
                                launchUrlString(
                                    'https://www.linkedin.com/in/gautam-chitransh-a47677205/');
                              },
                              child: Image.asset(
                                'assets/images/linkedin-colour.png',
                                width: min(50, b * 0.07),
                              ),
                            ).showCursor.zoomInOnHoverSmall,
                            SizedBox(
                              width: min(15, b * 0.02),
                            ),
                            GestureDetector(
                              onTap: () {
                                launchUrlString(
                                    'https://twitter.com/gautamchit60557');
                              },
                              child: Image.asset(
                                'assets/images/twitter-colour.png',
                                width: min(50, b * 0.07),
                              ),
                            ).showCursor.zoomInOnHoverSmall
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Contact",
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
}
