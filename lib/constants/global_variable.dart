import 'dart:io';

import 'package:flutter/material.dart';

String uri = "http://192.168.0.101:3000"; //our api uri
// String uri = Platform.isAndroid
//     ? 'http://192.168.0.104:3000'
//     : 'http://localhost:3000'; //our api uri
// 'http://<yourip>:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
}
