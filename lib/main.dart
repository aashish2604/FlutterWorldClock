import 'package:flutter/material.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/pages/loading.dart';
import 'package:world_clock/pages/location.dart';

void main() => runApp(MaterialApp(

  initialRoute: '/loading',
  routes: {
      '/': (context) => Location(),
      '/home': (context) => Home(),
      '/loading': (context) => Loading(),
  },
  ));

