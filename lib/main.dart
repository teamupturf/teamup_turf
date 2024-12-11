import 'package:flutter/material.dart';
import 'package:teamup_turf/admin/login_screen.dart';
import 'package:teamup_turf/splash_screen.dart';
import 'package:teamup_turf/turf/screens/turf%20registration.dart';
import 'package:teamup_turf/turf/screens/turf_booking.dart';
import 'package:teamup_turf/turf/screens/turf_details.dart';
import 'package:teamup_turf/turf/screens/turf_edit.dart';
import 'package:teamup_turf/user/screens/login_screen.dart';
import 'package:teamup_turf/user/screens/root_screen.dart';

import 'package:teamup_turf/user/screens/uat.dart';

import 'turf/screens/login_screen.dart';
import 'turf/screens/turf_homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AdminLoginScreen(),
    );
  }
}
