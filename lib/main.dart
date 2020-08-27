import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/splash.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/":  (context) => Splash(),
      "/loading": (context) => Loading(),
      "/home": (context) => Home(),
      "/location" : (context) => ChooseLocation()
    },
  ));
}