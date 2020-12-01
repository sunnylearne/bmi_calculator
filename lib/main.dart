import 'package:bmicalculator/screens/input_page.dart';
import 'package:flutter/material.dart';


void main() => runApp(BmiCalculator());

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0E21),
        scaffoldBackgroundColor: Color(0xff0a0E21),
      ),
      home: InputPage(),
    );
  }
}
