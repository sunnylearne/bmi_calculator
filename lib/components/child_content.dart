import 'package:bmicalculator/functions/constant.dart';
import 'package:flutter/material.dart';





class ChildContent extends StatelessWidget {

  final IconData icon;
  final String label;

  const ChildContent({@required this.icon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          label,
          style: KLabelTextStyle,
        ),
      ],
    );
  }
}