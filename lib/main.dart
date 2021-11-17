import 'package:dartz/dartz_streaming.dart';
import 'package:flutter/material.dart';
import 'package:socket/config/pages_route.dart';
import 'package:socket/pages/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        PageRoutes.a: (context) => HomePage(),
      },
    );
  }
}
