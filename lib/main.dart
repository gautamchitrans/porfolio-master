import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/home.dart';
//import 'package:my_portfolio/utils/firebase_config.dart';
import 'package:http/http.dart' as http;
import 'package:universal_io/io.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  increaseVisitorCounter() async {
    try {
      final response = await http.post(Uri.parse("https://ipapi.co/json"),
          headers: {'Content-Type': 'application/x-www-form-urlencoded'});

      var locationData;
      if (response.statusCode == 200) locationData = jsonDecode(response.body);
      // print(locationData);

      FirebaseFirestore.instance
          .collection('stats')
          .doc('visitorCounter')
          .update({"counter": FieldValue.increment(1)});

      Map<String, dynamic> data = {
        'country': locationData['country_name'],
        'city': locationData['city'],
        "lat": locationData['latitude'],
        'lon': locationData['longitude'],
        'ip': locationData['ip'],
        'isp': locationData['org'],
        'platform': Platform.operatingSystemVersion,
        "visitedAt": FieldValue.serverTimestamp()
      };

      FirebaseFirestore.instance.collection('visitorDetail').add(data);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    increaseVisitorCounter();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gautam Chitransh',
        navigatorObservers: [],
        theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.red,
            textTheme: TextTheme(
              headline1: GoogleFonts.poppins(),
              headline2: GoogleFonts.poppins(),
              headline3: GoogleFonts.poppins(),
              headline4: GoogleFonts.poppins(),
              headline5: GoogleFonts.poppins(),
              headline6: GoogleFonts.poppins(),
              subtitle1: GoogleFonts.poppins(),
              subtitle2: GoogleFonts.poppins(),
              bodyText1: GoogleFonts.poppins(fontSize: 16),
              bodyText2: GoogleFonts.poppins(),
            )),
        home: Home()
        //HomePage(),
        );
  }
}
