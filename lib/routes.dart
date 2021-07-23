import 'package:bar_code_reader/screens/camera/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:bar_code_reader/screens/authentication/authentication_screen.dart';


final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => AuthenticationScreen(),
  "/camera": (BuildContext context) => CameraScreen(),

  //"/ExScreen2": (BuildContext context) => ExScreen2(),
};