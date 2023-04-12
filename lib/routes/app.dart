import 'package:get/get.dart';
import '/screens/home.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/home': (context) => HomeScreen(),
  };
}
