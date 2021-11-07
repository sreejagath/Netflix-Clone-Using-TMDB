import 'package:flutter/material.dart';
import 'package:netflix_clone/Pages/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      theme: ThemeData(
          textTheme:
              TextTheme(bodyText2: TextStyle(
                color: Colors.white
              ))),
    ),
  );
}
