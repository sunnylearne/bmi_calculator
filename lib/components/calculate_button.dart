import 'package:bmicalculator/functions/constant.dart';
import 'package:flutter/material.dart';


class CalculateButton extends StatelessWidget {
  final  String buttonText;
  final Function onpresseds;

  const CalculateButton({ @required this.buttonText, @required this.onpresseds});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpresseds,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 35.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        padding:EdgeInsets.only(bottom: 20.0),
        color: KBottomContainerColor,
        width: double.infinity,
        height: KBottomContainerHeight,
      ),
    );
  }
}
